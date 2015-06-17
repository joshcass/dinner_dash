class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items

  def add_order_items(cart)
    cart.contents.each do |item_id, quantity|
      order_items.new(item_id: item_id.to_i, quantity: quantity)
    end
  end
end
