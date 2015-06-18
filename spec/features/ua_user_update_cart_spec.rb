require 'rails_helper'

describe 'user is able to update items inside cart', type: :feature do
  let(:item1) { Fabricate(:item) }
  let(:item2) { Fabricate(:item) }
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

  it 'allows user to update cart quanties' do
    #=====shop=====
    click_link('SHOP')
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    first(:link, item1.name).click

    find("#quantity", :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)

    expect(page).to have_content("You now have 1")

    #=====visit cart=====
    click_link("cart_link")

    expect(page).to have_content("Item")
    expect(page).to have_content("Remove Item")

    #======update quantities=====
    within_table("cart_table") do
    fill_in 'quantity', :with => 2
    end

    within_table("cart_table") do
      click_button("UPDATE")
      end

    expect(page).to have_content("Your cart has been updated.")
  end
end
