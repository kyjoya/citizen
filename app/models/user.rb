class User < ActiveRecord::Base
  belongs_to :petition

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
