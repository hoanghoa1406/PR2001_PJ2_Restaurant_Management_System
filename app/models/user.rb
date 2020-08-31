# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  level           :integer          default(1)
#  email           :string
#  password_digest :string
#  remember_digest :string
#  admin           :boolean
#
class User < ApplicationRecord
  has_many :reviews
  has_many :orders
end
