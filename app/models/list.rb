# frozen_string_literal: true

class List < ApplicationRecord
  # represents list of items
  belongs_to :bucket
  validates_presence_of :title, :bucket_id
end
