class Friendship < ApplicationRecord
  belongs_to :user

  # 朋友關係也屬於
  # belongs_to(:friend_target, class_name: "User", foreign_key: "friend_target_id", primary_key: "id")

  belongs_to :friend_target, class_name: "User"
end
