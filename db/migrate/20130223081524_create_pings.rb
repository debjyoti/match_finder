class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :profile_id
      t.integer :from_profile_id
      t.string :email

      t.timestamps
    end
  end
end
