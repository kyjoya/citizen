class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :petition

  validates :user, presence: true
  validates :petition, presence: true
  validates :user, uniqueness: { scope: :petition }
end
