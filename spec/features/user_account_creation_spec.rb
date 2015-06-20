require 'rails_helper'

describe 'user is able to create a new account', type: :feature do

  before(:each) do
    visit root_path
    click_link('SIGNUP')
  end

  it 'takes user to account creation page' do

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Display name")
    expect(page).to have_content("Email")
    expect(page).to have_button("Create User")
  end

  it 'creates a new user' do

    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Welcome to your new Bluer Bottle Coffee account.")
  end

  it 'gives error if user does not enter username' do

    expect(page).to have_button("Create User")

    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Username can't be blank")
  end

  it 'gives error if user does not enter password' do
  expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Password can't be blank")
  end

  it 'gives error if user does not enter password_confirmation' do
    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Password confirmation can't be blank")
  end

  it 'gives error if user does not enter first name' do
    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("First name can't be blank")
  end

  it 'gives error if user does not enter last name' do
    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Last name can't be blank")
  end

  it 'gives error if user does not enter email' do
    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    click_button("Create User")

    expect(page).to have_content("Email can't be blank")
  end

  it 'creates account without a display name' do
    expect(page).to have_button("Create User")

    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Email', :with => 'jefffafa@something.com'
    click_button("Create User")

    expect(page).to have_content("Welcome to your new Bluer Bottle Coffee account.")
  end
end
