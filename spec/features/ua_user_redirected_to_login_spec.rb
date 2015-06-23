require 'rails_helper'

describe 'ua users redirected at checkout', type: :feature do

  it 'redirects unregistered user to login page' do
    visit root_path
    click_link('cart_link')
    click_button('CHECKOUT')

    expect(page).to have_content("Login or Sign up!")
    expect(page).to have_link("No Account? Sign up!")
  end
end