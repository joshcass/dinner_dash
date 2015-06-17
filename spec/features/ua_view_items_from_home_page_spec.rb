require 'rails_helper'

describe 'unauthorized user view items by item and category', type: :feature do
  let(:item1) { Fabricate(:item) }
  let(:item2) { Fabricate(:item) }
  let(:category1) { Fabricate(:category) }
  let(:category2) { Fabricate(:category) }

  before(:each) do
    item1.categories << category1
    item2.categories << category2
    visit root_path
  end

  after(:each) do
    Fabrication.clear_definitions
  end

  it 'shows items from nav bar' do
    expect(page).to have_link("SHOP")

    click_link('SHOP')
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
  end

  it 'shows items from shop coffee button' do
    expect(page).to have_link("Shop Coffee")

    click_link('Shop Coffee')
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
  end

  it 'shows categories' do
    click_link('Shop Coffee')
    expect(page).to have_link(category1.name)
    expect(page).to have_link(category2.name)
  end

  it 'shows items associated with a category' do
    click_link('Shop Coffee')
    expect(page).to have_link(category1.name)
    expect(page).to have_link(category2.name)

    click_link(category1.name)
    expect(page).to have_content(item1.name)

    click_link(category2.name)
    expect(page).to have_content(item2.name)

    click_link("ALL")
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
  end

end
