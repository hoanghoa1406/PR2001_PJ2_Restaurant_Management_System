# == Schema Information
#
# Table name: order_tables
#
#  id         :integer          not null, primary key
#  book_id    :integer          not null
#  table_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderTable < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :table
end
