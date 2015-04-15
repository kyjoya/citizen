class User < ActiveRecord::Base
  belongs_to :petition

  ROLES = %w(member admin)

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
  validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
   role == 'admin'
  end

  def editable_by?(user)
   user.admin?
  end

  def destroyable_by?(user)
   user.admin?
  end
end
