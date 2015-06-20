require 'rails_helper'

RSpec.describe User, type: :model do
  let(:users) { Fabricate (:users) }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password confirmation' do
    user.password_confirmation = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without an email address' do
    user.email = nil
    expect(user).to_not be_valid
  end

  #Sad Path Tests

  it 'is invalid with short users name' do
    user.display_name = 'a'
    expect(user).to_not be_valid
  end
end
