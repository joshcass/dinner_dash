require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { item = Fabricate.build(:item)
                item.categories << category
                item.save
                item}
  let(:item2) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item}
  let(:category) { Fabricate(:category) }
  let(:category2) { Fabricate(:category) }

  before(:each) do
    item
    item2
    category
    category2
  end

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

  it 'is invalid with a price less than 0' do
    item.price = 0
    expect(item).to_not be_valid

    item.price = -1
    expect(item).to_not be_valid
  end

  it 'is invalid with a price thats not a valid decimal number' do
    item.price = "asdf"
    expect(item).to_not be_valid
  end

  it 'is invalid with duplicate name' do
    item2.name = item.name
    expect(item2).to_not be_valid
  end

  it 'is invalid without a category' do
    item.categories = []
    expect(item).to_not be_valid
  end

  it 'method returns category' do
    result = item.has_category?(category.id)
    expect(result).to eq(category)
  end

  it 'methods updates categories' do
    expect(item.item_categories.length).to eq(1)

    x = [category.id, category2.id]
    item.update_categories(x)

    expect(item.item_categories.length).to eq(2)
  end
end
