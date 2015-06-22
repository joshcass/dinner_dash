require 'rails_helper'

describe 'users logout', type: :feature do
  let(:user) { Fabricate(:user) }

  it 'existing users can logout' do
    visit root_path
    click_link "LOGIN"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "LOGIN"
    click_link "LOGOUT"

    expect(current_path).to eq(root_path)
  end
end
