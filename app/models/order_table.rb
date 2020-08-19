class OrderTable < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :table
end
