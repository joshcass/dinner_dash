require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { Fabricate(:user) }
  let(:item) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item}
  let(:category) { Fabricate(:category) }
  let(:cart) { Cart.new("#{item.id}" => 1)}
  let(:order) { order = Order.new(user_id: user.id, status: 0)
                order.add_order_items(cart)
                order.save
                order }

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is invalid without status' do
    order.status = nil
    expect(order).to_not be_valid
  end

  it 'is associated with a user' do
    expect(order).to respond_to(:user)
  end
end
