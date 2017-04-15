class Combo < ApplicationRecord
  has_many :combo_dishes
  has_many :dishes, through: :combo_dishes, dependent: :destroy
  has_many :order_combos

  validates :name, presence: true
  validates :discount, presence: true, numericality: true

  def subtotal
    combo_dishes.map{|combo_dish| (combo_dish.dish.price)}.sum
  end

  def price
    subtotal * discount / 100
  end

  def total
    dishes.sum(&:price)
  end
end
