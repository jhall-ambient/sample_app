# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true  # Just a method, don't need parens 
  									#(or curly braces when hash is last arg)

  validates :email, presence: true
end
