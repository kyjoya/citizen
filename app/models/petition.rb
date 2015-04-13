class Petition < ActiveRecord::Base
  has_one :owner, class_name: "User", foreign_key: "owner_id"
end
