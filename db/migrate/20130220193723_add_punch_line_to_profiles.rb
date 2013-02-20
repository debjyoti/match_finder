class AddPunchLineToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :punch_line, :string
  end
end
