require 'rails_helper'

RSpec.describe Petition, type: :model do
  it { should belong_to(:state) }
  it { should have_many(:memberships) }
  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
