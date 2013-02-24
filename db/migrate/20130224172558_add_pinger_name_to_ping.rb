class AddPingerNameToPing < ActiveRecord::Migration
  def change
    add_column :pings, :pinger_name, :string
  end
end
