# version 2.1 new table structure with Ruby and FFaker
desc "Generate fake Restaurant data."
namespace :dev do
  # for fake restaurant data
  task fake_restaurants: :environment do
    Restaurant.destroy_all

    15.times do
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        # for FK category_id
        category_id: Category.all.sample.id
      )
    end

    puts "Rake and FFaker have created fake restaurants."
    puts "Now we have #{Restaurant.count} restaurants."

  end

  # for fake user data
  task fake_users: :environment do
    # 這邊 User 砍下去，admin 也會被砍掉，能用 except 保留嗎？或是之後再用 rake db:seed
    User.destroy_all

    10.times do
      # 忘記欄位回去翻 schema.db
      User.create!(
        email: FFaker::Internet.email,

        # 神奇的事情發生了，我去 schema 看 明明這欄位就叫 `encrypted_password`
        # 但是錯誤回報是給 ActiveRecord::RecordInvalid: Validation failed: Password can't be blank
        # 是 Password
        # encrypted_password: FFaker::Name.unique.name
        password: FFaker::Name.unique.name
      )
    end

    puts "Rake and FFaker have created fake users."
    puts "Now we have #{User.count} users."
  end

  # for fake user comment
  task fake_comments: :environment do
    Comment.destroy_all

    # 要記得 comment 無法獨立存在，因爲 comment 一定是 user 對某個 restaurant 的評語
    # 因此思考跟切入的點要注意
    # 這個做法是爲每個餐廳建立 1 個評論，共做 3 次，因此每間餐廳會有 3 筆評論
    # 有同學分享其他想法跟做法，讚
    3.times do
      Restaurant.all.each do |restaurant|
        restaurant.comments.create!(
          user_id: User.all.sample.id,
          content: FFaker::Lorem.sentence
        )
      end
    end

    puts "Rake and FFaker have created fake comments."
    puts "Now we have #{Comment.count} comments."
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
