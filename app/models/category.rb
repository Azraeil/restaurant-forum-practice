class Category < ApplicationRecord
  # Let user must input category name
  validates_presence_of :name

  # A category has many restaurants.
  # 如果分類下已有餐廳，就不允許刪除分類 (並於執行刪除時拋出 error message)
  has_many :restaurants, dependent: :restrict_with_error
end
