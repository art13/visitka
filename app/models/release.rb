class Release < ActiveRecord::Base
	belongs_to :material
	attr_accessible :release_content_type, :demo, :alter_name, :release, :release_file_name, :release_file_size, :release_updated_at, :material_id, :created_at, :updated_at
	has_attached_file :release,
                      :url=> '/system/releases/:basename.:extension',
                      :patch =>':rails_root/public/system/releases/:basename.:extension',
                      #:default_url => "/assets/:style/rails.png",
  										:content_type => ["application/zip","application/rar","application/tgz"]	
end