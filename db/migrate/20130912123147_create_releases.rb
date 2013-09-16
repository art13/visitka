class CreateReleases < ActiveRecord::Migration
 def change
 	create_table :releases do |t|
 	  t.string :release_file_name
 	  t.string :alter_name
      t.string :release_content_type
      t.integer :release_file_size
      t.datetime :release_updated_at
      t.integer :material_id
      t.timestamps
 	end
 	
 end
end
