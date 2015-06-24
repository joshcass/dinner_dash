require 'rails_helper'

describe 'logged in user cannot view admin pages', type: :feature do
  let(:user) { Fabricate(:user) }
  let(:admin){ User.create(username: "admin", first_name: "admin", last_name: "admin", email: "admin@admin.com", password: "password", password_confirmation: "password", role: "admin")}

  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  it 'will not let user view admin items route' do
    visit admin_items_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it 'will not let user view admin user route' do
    visit admin_user_path(admin)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
