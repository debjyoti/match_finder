class ChangeAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :question, :question_text
  end
end
