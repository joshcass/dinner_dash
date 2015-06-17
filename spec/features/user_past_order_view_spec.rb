require 'rails_helper'

describe 'user past order views', type: :feature do
  let(:user) { Fabricate(:user) }

  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    page.click_link "Past Orders"
  end

  xit 'shows past orders' do
    #show order created_at? id?
    user.orders do |order|
      expect(page).to have_content(order.created_at)
      expect(page).to have_link(order.created_at, href: order_path(order))
    end
  end

  xit 'shows past order details' do
    page.click_link('CHANGE ME TO AN ORDER CREATED AT')
    expect(page).to have_content('ORDER STATUS')
    expect(page).to have_content('ORDER SUBTOTAL')
    expect(page).to have_content('ORDER DATE/TIME WAS SUBMITTED')
    expect(page).to have_content('ORDER DATE/TIME IF CANCELLED or COMPLETED')
    expect(page).to have_content('SOME ITEM')
    expect(page).to have_content('SOME ITEM PRICE')
    expect(page).to have_content('SOME ITEM QUANTITY')

    #This will be for an item that is retired
    page.click_link('SOME ITEM')
    expect(page).to have_content('ITEM DESCRIPTION')
    click_button 'Add'
    expect(page).to have_content('Item is unavailable')
  end
end
