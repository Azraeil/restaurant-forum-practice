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

  # for authenticate_admin method check role column value
  def admin?
    return self.role == "admin"
  end

  # 掛載 carrierwave upload for upload image
  mount_uploader :avatar, PhotoUploader
end
