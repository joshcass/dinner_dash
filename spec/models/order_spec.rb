require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { Fabricate(:user) }
  let(:order) { Order.create(user_id: user.id, status: 0) }

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
