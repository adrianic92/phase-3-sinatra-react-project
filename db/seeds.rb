puts "🌱 Seeding spices..."

# Seed your database here

10.times do |i|
    Restaurant.create(name: "#{Faker::Restaurant.unique.name}", description: "#{Faker::Restaurant.unique.description}", rating: rand(5..10), location: "#{Faker::Address.unique.full_address}", id: i+1)
end




puts "✅ Done seeding!"
