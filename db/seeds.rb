puts "🌱 Seeding restaurants..."

10.times do |i|
    Restaurant.create(name: "#{Faker::Restaurant.unique.name}", description: "#{Faker::Restaurant.unique.description}", rating: rand(5..10), location: "#{Faker::Address.unique.full_address}", id: i+1)
end

puts "🌱 Done seeding restaurants 🍳🍴🍽"
puts "🌱 Cooking Food 🍔🍕🍖🍝"

50.times do |i|
    Food.create(food_name: "#{Faker::Food.unique.dish}", dessert_pairing: "#{Faker::Dessert.flavor} #{Faker::Dessert.variety} with #{Faker::Dessert.topping}", restaurant_id: rand(1..10), id: i+1)
end

puts "✅ Done Cooking Food! 🍦🍮🍪"
