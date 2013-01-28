class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :user_questions do |t|
      t.text :question
      t.text :explanation
      t.references :profile

      t.timestamps
    end
    add_index :user_questions, :profile_id
  end
end
