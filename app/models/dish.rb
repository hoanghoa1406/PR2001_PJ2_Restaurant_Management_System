class Dish < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes
  has_many :orders, through: :order_details
end
