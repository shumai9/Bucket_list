class User < ApplicationRecord
  #associations
  has_many :bucket
  has_many :list, through: :bucket
  
  # encrypt password
  has_secure_password
  
  validates_presence_of  :first_name, :last_name, :password_digest
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable

  #devise auth commented so as jwt can take over 
  #:database_authenticatable,
end
