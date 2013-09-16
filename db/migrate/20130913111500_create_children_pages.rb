class CreateChildrenPages < ActiveRecord::Migration
  def change
  	create_table :children_pages do |t|
  		t.string :title
  		t.text :content
  		t.integer :page_id
  		t.attachment :photo
  	end	
  	
  end
end
