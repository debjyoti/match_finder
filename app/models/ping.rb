class Ping < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :email, :from_profile_id, :profile_id, :msg
end
