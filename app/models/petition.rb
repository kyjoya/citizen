class Petition < ActiveRecord::Base
  belongs_to :state
  has_one :owner, class_name: "User", foreign_key: "owner_id"

  validates :name, presence: true
  validates :description, presence: true
  validates :owner_id, presence: true
  validates :state_id, presence: true
end
