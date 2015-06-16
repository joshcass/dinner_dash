require 'rails_helper'

describe 'user login', type: :feature do
  let(:user) { User.create(username: "Tom", password: "password") }

  it 'existing user can login' do
    visit login_path
    fill_in "Username", with: "Tom"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(user_path(user))
  end
end
