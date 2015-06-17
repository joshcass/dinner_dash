require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {Fabricate(:item)}

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'is invalid without a name' do
    item.name = nil
    expect(item).to_not be_valid
  end

  it 'is invalid without a description' do
    item.description = nil
    expect(item).to_not be_valid
  end

  it 'is invalid without a price' do
    item.price = nil
    expect(item).to_not be_valid
  end
end