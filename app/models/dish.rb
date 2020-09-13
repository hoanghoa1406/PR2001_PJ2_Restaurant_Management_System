# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  name        :string
#  money       :integer
#  image_dish  :string
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Dish < ApplicationRecord
  belongs_to :category
  has_many :menu_dishes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_detail, dependent: :destroy
  has_many :menus , through : :menu_dish
  has_many :orders , through : :order_detail
                                                                                                
end
