class Answer < ActiveRecord::Base
  belongs_to :profile
  belongs_to :question
  attr_accessible :explanation, :option_id, :question_id, :chosen_option, :question_text
end
