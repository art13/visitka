class CreateAccountPosts < ActiveRecord::Migration
  def change
  	create_table :info_posts do |t|
  		t.string :title
  		t.text :content
  	end  	
  end
end
