class AddPingedNameToPings < ActiveRecord::Migration
  def change
    add_column :pings, :pinged_name, :string
  end
end
