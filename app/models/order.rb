class Order < ApplicationRecord
  has_many :order_tables
  has_many :order_details
  has_many :table , through: :order_tables
  has_many :dish , through: :order_details
end
