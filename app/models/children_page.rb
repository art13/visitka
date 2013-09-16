class ChildrenPage < ActiveRecord::Base
	belongs_to :page
	attr_accessible :title, :content, :photo, :page_id
	has_attached_file :photo, :styles=>{:medium=> "200x200", :small=>"100x100"}
end