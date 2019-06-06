require 'rails_helper'

RSpec.describe Bucket, type: :model do
  #association tests
  it { should belong_to(:user) }
  it { should have_many(:lists) }

  #validation test
  let(:user) { create(:user) }
  let(:invalid_bucket) { build(:bucket) }
  let(:valid_bucket) { build(:bucket, user_id: user.id) }

  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:author)}
  it {should validate_presence_of(:user_id)}

  #lesson leanred 
  #create does persist data
  #build does not persist
  #my mistake is I assumed after build user will obtain user id 
  #however I couldnt get it as it hasnt persisted yet
  
  
  context "when user id is not present" do
    before{ invalid_bucket.valid?}
    it 'prevents bucket with out user id from being saved' do
      expect(invalid_bucket.save).to eq(false)
    end
    it "gives error message of id - can't be blank & user must exist" do      
      expect(invalid_bucket.errors.messages).to match(
        {:user=>["must exist"], :user_id=>["can't be blank"]}
      )
    end
  end
  context "when user id is present" do    
    it "allows a bucket to be saved" do
      expect(valid_bucket.valid?).to eq(true)
    end
    it "gives no error messages" do      
      expect(valid_bucket.errors.messages).to match({})
    end
  end
end
