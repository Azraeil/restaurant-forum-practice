class Restaurant < ApplicationRecord
  # A restaurant belongs to specific category.
  belongs_to :category

  # A restaurant has_many comments.
  # 當 restaurant 物件被刪除時，同時刪除依賴的 comments
  has_many :comments, dependent: :destroy

  # 餐廳被很多使用者收藏，餐廳有很多收藏者
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  # 設定 name 欄位爲必填
  validates_presence_of :name

  # 掛載 carrierwave upload for upload image
  mount_uploader :image, PhotoUploader
end
