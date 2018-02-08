# version 2.1 new table structure with Ruby and FFaker
desc "Generate fake Restaurant data."
namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        # for FK category_id
        category_id: Category.all.sample.id
      )
    end

    puts "Rake and FFaker have created fake restaurants."
    puts "Now we have #{Restaurant.count} restaurants data."

  end
end

# version 2.0, with Ruby and FFaker
# namespace :dev do
#   task fake: :environment do
#     Restaurant.destroy_all
#
#     500.times do |i|
#       Restaurant.create!(name: FFaker::Name.first_name,
#         opening_hours: FFaker::Time.datetime,
#         tel: FFaker::PhoneNumber.short_phone_number,
#         address: FFaker::Address.street_address,
#         description: FFaker::Lorem.paragraph
#       )
#     end
#     puts "Rake and FFaker have created fake restaurants."
#     puts "Now we have #{Restaurant.count} restaurants data."
#   end
# end

# version 1.0, by Ruby only
# namespace :dev do
#   task fake: :environment do
#     Restaurant.destroy_all
#
#     500.times do |i|
#       Restaurant.create!(name: "restaurant#{i.to_s}",
#         opening_hours: "11:30",
#         tel: "02-1234-5678",
#         address: "my_address",
#         description: "Here is test description of the restaurant."
#       )
#     end
#     puts "Rake has created fake restaurants."
#     puts "Now we have #{Restaurant.count} restaurants data."
#   end
# end
