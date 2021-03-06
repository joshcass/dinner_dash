require 'rails_helper'

describe 'users is able to create a new account', type: :feature do
  let(:valid_entry){
    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
  }

  before(:each) do
    visit root_path
    click_link('SIGNUP')
  end

  it 'takes users to account creation page' do

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Display name")
    expect(page).to have_content("Email")
    expect(page).to have_button("Create User")
  end

  it 'creates a new users' do

    expect(page).to have_button("Create User")

    valid_entry
    click_button("Create User")

    expect(page).to have_content("Welcome to your new Bluer Bottle Coffee account.")
  end

  it 'gives error if users does not enter username' do

    expect(page).to have_button("Create User")

    valid_entry
    fill_in 'Username', :with => nil
    click_button("Create User")

    expect(page).to have_content("Username can't be blank")
  end

  it 'gives error if users does not enter password' do
  expect(page).to have_button("Create User")

    valid_entry
    fill_in 'Password', :with => nil

    click_button("Create User")

    expect(page).to have_content("Password can't be blank")
  end

  it 'gives error if users does not enter password_confirmation' do
    expect(page).to have_button("Create User")

    valid_entry
    fill_in "Password confirmation", :with => nil
    click_button("Create User")

    expect(page).to have_content("Password confirmation can't be blank")
  end

  it 'gives error if users does not enter first name' do
    expect(page).to have_button("Create User")

    valid_entry
    fill_in "First name", :with => nil

    click_button("Create User")

    expect(page).to have_content("First name can't be blank")
  end

  it 'gives error if users does not enter last name' do
    expect(page).to have_button("Create User")

    valid_entry
    fill_in "Last name", :with => nil
    click_button("Create User")

    expect(page).to have_content("Last name can't be blank")
  end

  it 'gives error if users does not enter email' do
    expect(page).to have_button("Create User")

    valid_entry
    fill_in 'Email', :with => nil
    click_button("Create User")

    expect(page).to have_content("Email can't be blank")
  end

  it 'creates account without a display name' do
    expect(page).to have_button("Create User")

    valid_entry
    fill_in 'Display name', :with => nil
    click_button("Create User")

    expect(page).to have_content("Welcome to your new Bluer Bottle Coffee account.")
  end
end
