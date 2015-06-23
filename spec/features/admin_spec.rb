require 'rails_helper'

describe 'admin', type: :feature do

  let(:admin) { User.create(username: 'admin', password: 'password',
                            password_confirmation: 'password', first_name: 'Justin',
                            last_name: 'Bieber', email: 'asdf@gmail.com',
                            role: 1) }
  let(:category) { Fabricate(:category) }
  let(:item) { item = Fabricate.build(:item)
               item.categories << category
               item.save
               item }

  before(:each) do
    item
    category
    visit root_path
    click_link 'LOGIN'
    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password
    click_button 'LOGIN'
  end

  it 'admin can login' do
    expect(page).to_not have_content('LOGIN')
  end

  it 'admin can create items' do
    click_link 'JUSTIN'
    click_link 'Create Item'
    within('#create_item') do
      fill_in 'Name', with: 'coffee'
      fill_in 'Description', with: 'asdf'
      fill_in 'Price', with: '9'
      fill_in 'Overview', with: '123'
      fill_in 'Details', with: 'lol'
      find(:css, "#item_category_ids_[value='2']").set(true)
      click_button 'Create Item'
    end
    click_link 'SHOP'
    click_link 'coffee'
    expect(page).to have_content('coffee')
    expect(page).to have_content('asdf')
    expect(page).to have_content('9')
  end

  it 'admin can create categories' do
    click_link 'JUSTIN'
    click_link 'Create Category'
    within('#create_category') do
      fill_in 'Name', with: 'Awesome'
      click_button 'Create Category'
    end
    click_link 'SHOP'
    expect(page).to have_content('Awesome')
  end

  it 'admin can retire items' do
    click_link 'SHOP'
    click_link item.name
    click_link 'Edit Item'
    within('#edit') do
      find(:css, "#item_status[value='retired']").set(true)
      click_button 'Update Item'
    end
    click_link 'LOGOUT'
    click_link 'SHOP'
    expect(page).to_not have_content(item.name)
  end
end
