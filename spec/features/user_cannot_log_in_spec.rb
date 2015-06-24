require 'rails_helper'

describe 'user cannot log in if already logged in' do
  let(:user) { Fabricate(:user) }

  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit root_path
  end

  it 'will not allow user to log in' do
    expect(page).to_not have_content("LOGIN")
  end
end