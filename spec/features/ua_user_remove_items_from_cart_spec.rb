require 'rails_helper'

describe 'users is able to remove items from cart', type: :feature do
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

  it 'removes items from cart' do
    click_link('SHOP')

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    first(:link, item1.name).click

    find('#quantity', :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)

    expect(page).to have_content("You now have 1")
    first(:link, item1.name).click

    find('#quantity', :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)

    expect(page).to have_content("You now have 2")

    click_link('cart_link')

    within_table("cart_table") do
      click_link("X")
    end

    expect(page).to have_content("Item removed from cart")
  end

end
