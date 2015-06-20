require 'rails_helper'

describe 'user is able to view item details', type: :feature do
  let(:item1) { item = Fabricate.build(:item)
                item.categories << category1
                item.save
                item}
  let(:item2) { item = Fabricate.build(:item)
                item.categories << category2
                item.save
                item}
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

  it 'shows user item details' do
    click_link('SHOP')
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)

    first(:link, item1.name).click
    expect(page).to have_content("Overview")
    expect(page).to have_content("Details")
    expect(page).to have_content("shipping included")
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
  end
end
