puts "🌱 Seeding spices..."

# Seed your database here

10.times do |i|
    Restaurant.create(name: "#{Faker::Restaurant.unique.name}", description: "#{Faker::Restaurant.unique.description}", rating: rand(5..10), location: "#{Faker::Address.unique.full_address}", id: i+1)
end

50.times do
    Food.create(food_name: "#{Faker::Food.unique.name}", dessert_pairing: "#{Faker::Dessert.flavor} #{Faker::Dessert.variety} with #{Faker::Dessert.topping}", restaurant_id: rand(1..10))
end




puts "✅ Done seeding!"
