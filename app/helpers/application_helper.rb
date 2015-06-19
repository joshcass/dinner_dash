module ApplicationHelper
  def quantity_range(order_item)
    0..order_item.quantity + 10
  end
end
