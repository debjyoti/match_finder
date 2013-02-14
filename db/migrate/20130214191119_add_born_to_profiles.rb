class AddBornToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :born, :date
  end
end
