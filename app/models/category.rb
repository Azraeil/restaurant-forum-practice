class Category < ApplicationRecord
  # Let user must input category name
  validates_presence_of :name

  # A category has many restaurants.
  has_many :restaurants
end
