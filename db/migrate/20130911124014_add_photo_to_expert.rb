class AddPhotoToExpert < ActiveRecord::Migration
  def self.up
	change_table :experts do |t|
		t.attachment :photo  
    end
    change_table :posts do |t|
    	t.attachment :photo
    end
  end
  def self.down
  	drop_attachment_file :experts, :photo
  	drop_attachment_file :posts, :photo
  end
end
