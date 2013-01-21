class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :weight
      t.string :category

      t.timestamps
    end
  end
end
