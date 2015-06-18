5.times do
  Category.create(name: Faker::Lorem.word)
end


20.times do
  item = Item.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, overview: Faker::Lorem.paragraph, details: Faker::Lorem.sentence, price: Faker::Commerce.price)
  category = Category.all.sample
  item.item_categories.create(category_id: category.id)
end


10.times do
  item = Item.all.sample
  category = Category.all.sample
  item.item_categories.find_or_create_by(category_id: category.id)
end
