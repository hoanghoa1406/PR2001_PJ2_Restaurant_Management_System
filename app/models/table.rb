# == Schema Information
#
# Table name: tables
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string           default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Table < ApplicationRecord
  has_many :orders , through: :order_tables
end
