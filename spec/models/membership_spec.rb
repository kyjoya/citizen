require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:petition) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:petition) }

  # it 'should validate uniqueness of membership' do
  #   membership = FactoryGirl.create(:membership)
  #   membership_2 = FactoryGirl.create(:membership, user_id: membership.user_id,
  #    petition_id: membership.petition_id)
  #   expect { membership_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
  # end
end
