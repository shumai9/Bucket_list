class List < ApplicationRecord
  belongs_to :bucket
  validates_presence_of :title, :bucket_id 
end
