# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Category seed data
Category.destroy_all

category_list = [
  { name: "台式料理" },
  { name: "中式料理" },
  { name: "日本料理" },
  { name: "墨西哥料理" },
  { name: "美式料理" },
  { name: "越南料理" },
  { name: "複合式料理" }
]

category_list.each do |category|
  Category.create( name: category[:name])
end

puts "Category seed data created!"

# Default admin account
User.create(name: "admin", email: "admin@test.com", password: "123123", role: "admin")
puts "Default admin account created!"
