class CreateFeedbacks < ActiveRecord::Migration
  def change
  	create_table :feedbacks do |t|
  		t.string :fio
  		t.string :email, :null => false
  		t.string :message, :null=> false
  		t.boolean :subscribe, :default => false
  	end
  	
  end
end
