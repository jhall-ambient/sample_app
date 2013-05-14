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
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  #before_save { |user| user.email = email.downcase }
  before_save { email.downcase!}  #does same thing
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }  # Just a method, don't need parens 
  									#(or curly braces when hash is last arg)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  				format: { with: VALID_EMAIL_REGEX },
  				uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  # End of private section (idented only to show all that is private more visably, not needed)
end
