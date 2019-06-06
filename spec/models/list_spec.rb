require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to(:bucket) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :bucket_id }
end
