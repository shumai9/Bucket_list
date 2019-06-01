class Bucket < ApplicationRecord
  belongs_to :user
  has_many :list
end
