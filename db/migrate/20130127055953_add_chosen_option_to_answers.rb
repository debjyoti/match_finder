class AddChosenOptionToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :chosen_option, :string
  end
end
