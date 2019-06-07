# frozen_string_literal: true

class Bucket < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy
  validates_associated :lists
  validates_presence_of :title, :author, :user_id
end
