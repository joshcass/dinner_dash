require 'rails_helper'

describe 'us user can browse items', type: :feature do
  let(:item1) { Fabricate(:item) }
  let(:item2) { Fabricate(:item) }
  let(:category1) { Fabricate(:category) }
  let(:category2) { Fabricate(:category) }

  before(:each) do
    item1.categories << category1
    item2.categories << category2
    visit items_path
  end

  after(:each) do
    Fabrication.clear_definitions
  end

  it 'shows items on page' do
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
  end

  it 'shows items by category' do
    expect(page).to have_link("#{category1.name}", href: category_path(category1))
    click_link("#{category1.name}")
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    expect(page).to_not have_content(item2.name)
    expect(page).to_not have_content(item2.description)
    expect(page).to_not have_content(item2.price)
  end
end
