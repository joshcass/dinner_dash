require 'rails_helper'

describe 'user login', type: :feature do
  let(:user) { Fabricate(:user) }

  it 'existing users can login' do
    visit root_path
    click_on "LOGIN"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "LOGIN"

    expect(page).to have_content(user.first_name.upcase)
    expect(page).to_not have_content("LOGIN")
  end
end
