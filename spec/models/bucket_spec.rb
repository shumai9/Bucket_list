require 'rails_helper'

RSpec.describe Bucket, type: :model do
  it { should belong_to(:user)}
  it { should have_many(:list)}
end
