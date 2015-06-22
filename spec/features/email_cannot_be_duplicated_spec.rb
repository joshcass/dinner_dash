#verify that an email cannot belong to more than one account
require 'rails_helper'

describe 'users is able to create a new account', type: :feature do
  let(:user_one){
    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jefffafa@something.com'
  }

  let(:user_two){
    fill_in 'Username', :with => 'JeffC'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'First name', :with => 'Jeff'
    fill_in 'Last name', :with => 'Franklin'
    fill_in 'Display name', :with => 'Frankie'
    fill_in 'Email', :with => 'jcasmir@turing.io'
  }

  it 'will not allow same username on two accounts' do
    visit new_user_path

    user_one
    click_button("Create User")

    visit new_user_path
    user_two
    click_button("Create User")

    expect(page).to have_content("Username has already been taken")


end
end
