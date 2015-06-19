class Order < ActiveRecord::Base
  validate :at_least_one_item
  validates :user, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(ordered paid cancelled completed)

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

  private

  def at_least_one_item
    errors.add(:base, 'Your cart is empty') if order_items.empty?
  end
end
