require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:memberships) }
  it { should have_many(:petitions) }

  it { should validate_presence_of(:role) }
  it { should have_valid(:role).when("admin") }
  it { should_not have_valid(:role).when("Guest") }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:username) }

  it 'should validate uniqueness of user' do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.build(:user, email: user.email)

    expect { user_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
