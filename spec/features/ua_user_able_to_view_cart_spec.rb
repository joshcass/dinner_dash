require 'rails_helper'

describe 'user is able to add items to cart', type: :feature do
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

  it 'allows user to view cart' do
    expect(page).to have_link("cart_link")

    click_link("cart_link")
    expect(page).to have_content("Item")
    expect(page).to have_content("Remove Item")
  end

  it 'allows user to update cart quanties' do
    #=====shop=====
    click_link('SHOP')
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    fill_in('Quantity', with: '1', :match => :first )
    click_button('BUY', :match => :first)

    expect(page).to have_content("You now have 1")

    fill_in('Quantity', with: '1', :match => :first )
    click_button('BUY', :match => :first)

    #=====visit cart=====
    click_link("cart_link")

    expect(page).to have_content("Item")
    expect(page).to have_content("Remove Item")

    #======update quantities=====
    # within_table("cart_table") do
    # fill_in 'quantity', :with => 2
    # end
    #
    # page.find('table', :text => "Quantity").click_link("UPDATE")
    #
    # expect(page).to have_content("Your cart has been updated.")



  end
end
