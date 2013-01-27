class CreateWebLinks < ActiveRecord::Migration
  def change
    create_table :web_links do |t|
      t.string :link_type
      t.string :link_url
      t.references :profile

      t.timestamps
    end
    add_index :web_links, :profile_id
  end
end
