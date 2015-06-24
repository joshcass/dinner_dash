require 'rails_helper'

describe 'logged in user cannot access other users info', type: :feature do
  let(:user_1) { Fabricate(:user) }
  let(:user_2) { Fabricate(:user) }

  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user_1)
  end

  it 'will not let logged in user access another users page' do
    visit user_path(user_2)
    expect(page).to have_content(user_1.first_name)
    expect(page).not_to have_content(user_2.first_name)
  end

end
