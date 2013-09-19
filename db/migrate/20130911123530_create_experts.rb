class CreateExperts < ActiveRecord::Migration
 def change
 	create_table :experts do |t|
 		t.string :firstname
 		t.string :lastname
 		t.string :secondname
 		t.string :email
 		t.string :phone
 		t.attachment :photo
 	end
 	
 end
end
