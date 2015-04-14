class State < ActiveRecord::Base
  has_many :petitions

  validates :name, presence: true, uniqueness:true

  def to_param
    name
  end
end
