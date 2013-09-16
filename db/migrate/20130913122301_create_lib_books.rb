class CreateLibBooks < ActiveRecord::Migration
  def change
  	create_table :lib_books do |t|
  		t.string :title
  		t.text :content 
  		t.attachment :photo	
  	end
  end
end
