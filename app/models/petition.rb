class Petition < ActiveRecord::Base
  belongs_to :state
  has_one :owner, class_name: "User", foreign_key: "owner_id"
  has_many :memberships
  has_many :users, through: :memberships
  mount_uploader :image, PetitionPhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :owner_id, presence: true
  validates :state_id, presence: true

  def self.search(search)
    if search
      where(["name ILIKE ?", "%#{search}%"])
    else
      all
    end
  end

  def self.state_search(search, state)
    if search
      where(["name ILIKE ?", "%#{search}%"]).where(state: state)
    else
      where(state: state).limit(10)
    end
  end
end
