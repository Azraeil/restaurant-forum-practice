class Followship < ApplicationRecord
  # 每一筆追蹤記錄，屬於發出追蹤的使用者。
  belongs_to :user

  # 每一筆追蹤記錄，屬於被追蹤的使用者。
  belongs_to :follow_target, class_name: "User"
end
