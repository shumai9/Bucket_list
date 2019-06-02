class Bucket < ApplicationRecord
  belongs_to :user
  has_many :lists
  validates_associated :lists
end
