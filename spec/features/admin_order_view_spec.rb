require 'rails_helper'

describe 'users past order views', type: :feature do
  let(:admin) { User.create(username: 'admin', password: 'password',
    password_confirmation: 'password', first_name: 'Justin',
    last_name: 'Bieber', email: 'asdf@gmail.com',
    role: 1) }
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
    click_link 'SHOP'
    click_link(item.name)
    find('#quantity', :match => :first).find(:xpath, 'option[2]').select_option
    click_button('ADD TO CART', :match => :first)
    click_link('cart_link')
    click_button('CHECKOUT')
  end

  it 'admin can view orders and access order show' do
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit root_path
    click_link 'JUSTIN'
    expect(page).to have_content('Order Status Totals')
    first(:link, 'MARK AS PAID').click
    expect(page).to have_content('MARK AS COMPLETED')
    page.find("[data-reveal-id='order_1']").click
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.name)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(item.price)
  end
end
