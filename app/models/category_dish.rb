class CategoryDish < ApplicationRecord
  belongs_to :category
  belongs_to :dish
end
