class User < ApplicationRecord
  has_many :buckets
  has_many :lists, through: :buckets
  validates_associated :buckets
  has_secure_password
  devise :registerable, :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name, :password_digest 
end
