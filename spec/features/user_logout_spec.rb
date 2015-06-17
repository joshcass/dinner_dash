require 'rails_helper'

describe 'user logout', type: :feature do
  let(:user) { User.create(username: "Tom", password: "password") }

  xit 'existing user can logout' do
    visit login_path
    fill_in "Username", with: "Tom"
    fill_in "Password", with: "password"
    click_button "Login"
    click_button "Logout"

    expect(current_path).to eq(login_path)
  end
end
