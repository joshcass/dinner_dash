require 'rails_helper'

describe 'users past order views', type: :feature do
  let(:user) { Fabricate(:user) }
  let(:category) { Fabricate(:category) }
  let(:item) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item }

  before(:each) do
    user
    category
    item
    # ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit root_path
    click_link 'LOGIN'
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "LOGIN"
    click_link 'SHOP'
    click_link(item.name)
    find('#quantity', :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)
    click_link('cart_link')
    click_button('CHECKOUT')
  end

  it 'shows past orders' do
    user.orders do |order|
      expect(page).to have_content(order.created_at)
      expect(page).to have_content(order.total_cost)
      expect(page).to have_content(order.status)
    end
  end

  xit 'shows past order details' do
    order = user.orders.first
    page.find("[data-reveal-id='order_#{order.id}']").click
    expect(page).to have_content('Order Details')
    expect(page).to have_content(order.status.capitalize)
    expect(page).to have_content(order.total_cost)
    expect(page).to have_content(order.items.first.name)

    click_link(item.name)
    expect(page).to have_content(item.description)
    click_button 'ADD TO CART'
    expect(page).to have_content('Item is unavailable')
  end
end
