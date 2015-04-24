class State < ActiveRecord::Base
  has_many :petitions
  has_many :state_word_counts

  validates :name, presence: true, uniqueness:true

  def to_param
    name
  end
end
