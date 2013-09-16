class CreatePages < ActiveRecord::Migration
  def change
  	create_table :pages do |t|
  		t.string :title
  		t.text :content
  		t.attachment :photo
  	end
  end
end
