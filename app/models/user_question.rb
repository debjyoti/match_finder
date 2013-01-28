class UserQuestion < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :explanation, :question
end
