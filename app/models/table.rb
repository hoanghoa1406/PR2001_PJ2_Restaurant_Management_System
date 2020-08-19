class Table < ApplicationRecord
  has_many :order , through: :order_tables
end
