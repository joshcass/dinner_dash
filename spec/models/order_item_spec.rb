require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:item) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item}
  let(:category) { Fabricate(:category) }
  let(:order) { Order.create(status: 0) }
  let(:order_item) { OrderItem.create(order_id: order.id, item_id: item.id, quantity: 3) }

  it 'is valid' do
    expect(order_item).to be_valid
  end

  it 'is invalid without a quantity' do
    order_item.quantity = nil
    expect(order_item).to_not be_valid
  end

  it 'is invalid without a quantity greater than 0' do
    order_item.quantity = 0
    expect(order_item).to_not be_valid
  end

  it 'is associated with an order' do
    expect(order_item).to respond_to(:order)
  end

  it 'is associated with a item' do
    expect(order_item).to respond_to(:item)
  end
end
