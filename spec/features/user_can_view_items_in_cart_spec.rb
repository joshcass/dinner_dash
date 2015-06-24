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

  it 'lets authorized user views in cart' do
    click_link('SHOP')
    first(:link, item1.name).click
    find('#quantity', :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)

    click_link("cart_link")
    expect(current_path).to eq('/orders/new')
    expect(page).to have_content(user.display_name)
  end


end

