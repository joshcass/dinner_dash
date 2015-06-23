require 'rails_helper'

describe 'ua user cannot view other user pages', type: :feature do

  it 'routes ua user to login screen if attempt to access user page' do
    visit items_path
    expect(page).to have_content("LOGIN")

    visit '/users/1'
    expect(page).to have_content("Login or Sign up!")
  end
end