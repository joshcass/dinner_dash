class Order < ActiveRecord::Base
  include AASM
  validate :at_least_one_item
  validates :user, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(ordered paid cancelled completed)

  aasm :column => :status, :enum => true do
    state :ordered, :initial => true
    state :paid
    state :cancelled
    state :completed

    event :pay do
      transitions from: :ordered, to: :paid
    end

    event :cancel do
      transitions from: [:ordered, :paid], to: :cancelled
    end

    event :complete do
      transitions from: :paid, to: :completed
    end
  end

  def add_order_items(cart)
    cart.contents.each do |item_id, quantity|
      order_items.new(item_id: item_id.to_i, quantity: quantity)
    end
  end

  def total_cost
    order_items.map(&:price_subtotal).reduce(:+)
  end

  def total_items
    order_items.sum(:quantity)
  end

  def update_status(params)
    case params[:status]
      when 'pay'
        self.pay!
      when 'cancel'
        self.cancel!
      when 'complete'
        self.complete!
    end
  end

  def status_locked?
    completed? || cancelled?
  end

  private

  def at_least_one_item
    errors.add(:base, 'Your cart is empty') if order_items.empty?
  end
end
