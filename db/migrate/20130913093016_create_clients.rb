class CreateClients < ActiveRecord::Migration
 def change
 	create_table :clients do |t|
 		t.string :name
 		t.string :comment
 		t.attachment :photo
 	end
 end
end
