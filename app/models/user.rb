class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 讓使用者在註冊時一定要寫名字
  validates_presence_of :name

  # User has_many comments.
  # 如果 User 已有評論，就不允許刪除帳號 (刪除時拋出 Error)
  has_many :comments, dependent: :restrict_with_error

  # 實現多對多關聯
  has_many :commented_restaurants, through: :comments, source: :restaurant

  # 使用者收藏很多餐廳的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # for 追蹤使用者
  # 一個使用者有很多追蹤記錄
  has_many :followships, dependent: :destroy

  # 透過追蹤記錄，使用者有很多追蹤目標
  has_many :follow_targets, through: :followships

  # 設定反向追蹤記錄，找出追隨使用者的有哪些人
  # 先找出追蹤記錄
  has_many :inverse_followships, class_name: "Followship", foreign_key: "follow_target_id"

  # 找出追蹤者的資料
  has_many :followers, through: :inverse_followships, source: :user

  # For 交友記錄 (仿追蹤使用者)
  # 一個使用者有很多交友記錄
  has_many :friendships, dependent: :destroy

  # 透過交友記錄，使用者有很多朋友
  # has_many :friend_tagets, through: :friendships, source: :friend_target
  has_many :friend_targets, through: :friendships


  # for authenticate_admin method check role column value
  def admin?
    return self.role == "admin"
  end

  # 檢查追蹤使用者記錄是否存在
  def is_followed?(target_user)
    self.follow_targets.include?(target_user)
  end

  # 掛載 carrierwave upload for upload image
  mount_uploader :avatar, PhotoUploader
end
