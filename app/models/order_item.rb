class OrderItem < ActiveRecord::Base
  validates :quantity, presence: true,
                       numericality: { greater_than: 0 }

  belongs_to :order
  belongs_to :item

  def item_total
    quantity * item.price
  end
end

