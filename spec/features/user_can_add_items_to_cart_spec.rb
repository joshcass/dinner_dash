require 'rails_helper'

describe 'authorized user can add items to cart', type: :feature do
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

  let(:user) { Fabricate(:user) }

  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    item1.categories << category1
    item2.categories << category2
    visit root_path
  end

  it 'adds items to cart' do
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
  end
end