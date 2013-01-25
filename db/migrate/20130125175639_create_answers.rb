class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :option_id
      t.text :explanation
      t.references :profile

      t.timestamps
    end
    add_index :answers, :profile_id
  end
end
