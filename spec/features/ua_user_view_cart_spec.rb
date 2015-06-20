require 'rails_helper'

describe 'user is able to add items to cart', type: :feature do
  let(:item1) { item = Fabricate.build(:item)
                item.categories << category1
                item.save
                item}
  let(:item2) { item = Fabricate.build(:item)
                item.categories << category2
                item.save
                item}
  let(:category1) { Fabricate(:category) }
  let(:category2) { Fabricate(:category) }

  before(:each) do
    item1.categories << category1
    item2.categories << category2
    visit root_path
  end

  after(:each) do
    Fabrication.clear_definitions
  end

  it 'allows user to view cart' do
    expect(page).to have_link("cart_link")

    click_link("cart_link")
    expect(page).to have_content("Item")
    expect(page).to have_content("Remove Item")
  end
end
