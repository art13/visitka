class CreateLicKeys < ActiveRecord::Migration
 def change
 	create_table :lic_keys do |t|
 		t.integer :material_id
 		t.integer :order_id
 		t.string :lic
 		t.string :status
 	end
 end
end
