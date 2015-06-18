class Order < ActiveRecord::Base
  # validate :at_least_one_item
  validates :user, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def add_order_items(cart)
    cart.contents.each do |item_id, quantity|
      order_items.new(item_id: item_id.to_i, quantity: quantity)
    end
  end

  private

  def at_least_one_item
    errors.add(:base, 'must add at least one item') if self.items.empty?
  end
end
