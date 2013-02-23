class AddMsgToPing < ActiveRecord::Migration
  def change
    add_column :pings, :msg, :text
  end
end
