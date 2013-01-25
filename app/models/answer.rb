class Answer < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :explanation, :option_id, :question_id
end
