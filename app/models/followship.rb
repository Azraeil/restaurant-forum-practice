class Followship < ApplicationRecord
  # 每一筆追蹤記錄，屬於發出追蹤的使用者。
  belongs_to :user

  # 每一筆追蹤記錄，屬於被追蹤的使用者。
  belongs_to :follow_target, class_name: "User"

  # 在同一個 user_id 下，每個 follow_target_id 都是獨立的。
  validates :follow_target_id, uniqueness: { scope: :user_id}
end
