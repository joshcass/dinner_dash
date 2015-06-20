module ApplicationHelper
  def quantity_range(order_item)
    0..order_item.quantity + 10
  end

  def orders
    Order.all
  end

  def categories
    Category.all
  end

  def category_list
    categories.map { |category| [category.name, category.id] }
  end
end
