class Petition < ActiveRecord::Base
  belongs_to :state
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :owner_id, presence: true
  validates :state_id, presence: true
end
