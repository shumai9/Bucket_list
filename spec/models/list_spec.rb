require 'rails_helper'

RSpec.describe List, type: :model do
  it{ should belong_to(:bucket) }
end
