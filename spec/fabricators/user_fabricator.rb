Fabricator(:user) do
  first_name Faker::Name.first_name
  last_name Faker::Name.last_name
  username Faker::Internet.user_name
  password 'password'
  email Faker::Internet.email
end
