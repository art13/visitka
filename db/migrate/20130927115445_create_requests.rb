class CreateRequests < ActiveRecord::Migration
 def change
 	create_table :lic_requests do |t|
 		t.string :name
 		t.string :phone
 		t.string :email 
 		t.boolean :confirmed, :default=>false
 		t.timestamps
 	end
 	
 end
end
