class Page < ActiveRecord::Base
	has_many :children_pages
	attr_accessible :title, :content, :photo
	has_attached_file :photo, :styles=>{:medium=> "200x200", :small=>"100x100"}
end