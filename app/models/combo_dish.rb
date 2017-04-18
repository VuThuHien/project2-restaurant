class ComboDish < ApplicationRecord
  belongs_to :combo
  belongs_to :dish
end
