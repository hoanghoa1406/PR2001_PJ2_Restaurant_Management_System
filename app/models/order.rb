# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  has_many :order_tables
  has_many :order_details
  has_many :tables , through: :order_tables
  has_many :dishes , through: :order_details
end
