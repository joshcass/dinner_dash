require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  let(:item) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item}
  let(:category) { Fabricate(:category) }
  let(:item_category) { ItemCategory.create(item_id: item.id, category_id: category.id) }

  it 'is associated with an order' do
    expect(item_category).to respond_to(:item)
  end

  it 'is associated with a item' do
    expect(item_category).to respond_to(:category)
  end
end
