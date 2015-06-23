require 'rails_helper'

describe 'user can log out', type: :feature do
  let(:user) { Fabricate(:user) }

  it 'lets user log out' do
    visit root_path
    click_on "LOGIN"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "LOGIN"
    expect(page).to have_content("LOGOUT")

    click_link("LOGOUT")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("LOGIN")

  end
end