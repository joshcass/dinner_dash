Fabricator(:item) do
  name Faker::Commerce.product_name
  description Faker::Lorem.paragraph
  price Faker::Commerce.price
end
