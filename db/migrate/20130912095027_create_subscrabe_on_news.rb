class CreateSubscrabeOnNews < ActiveRecord::Migration
 def change
 	create_table :subscribers do |t|
 		t.string :email, :null => false
 	end 	
 end
end
