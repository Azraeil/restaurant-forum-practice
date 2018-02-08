class Restaurant < ApplicationRecord
  # A restaurant belongs to specific category.
  belongs_to :category

  # 設定 name 欄位爲必填
  validates_presence_of :name

  # 掛載 carrierwave upload for upload image
  mount_uploader :image, PhotoUploader
end
