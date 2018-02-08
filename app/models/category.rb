class Category < ApplicationRecord
  # A category has many restaurants.
  has_many :restaurants
end
