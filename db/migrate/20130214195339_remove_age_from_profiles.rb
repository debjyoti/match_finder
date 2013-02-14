class RemoveAgeFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :age
  end

  def down
    add_column :profiles, :age, :integer
  end
end
