require 'rails_helper'

describe 'ua user cannot view admin pages', type: :feature do

  it 'stops ua user from viewing admin items page' do
    visit items_path
    expect(page).to have_link("LOGIN")

    visit admin_items_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it 'stops ua user from viewing admin item show pages' do
    visit items_path
    expect(page).to have_link("LOGIN")

    visit '/admin/items/:id'
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it 'stops ua user from viewing admin category show pages' do
    visit items_path
    expect(page).to have_content("LOGIN")

    visit '/admin/categories/:id'
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it 'routes to login if ua user attempts to access admin user page' do
    visit items_path
    expect(page).to have_link("LOGIN")

    visit '/admin/users/:id'
    expect(page).to have_content("Login or Sign up!")

  end
end