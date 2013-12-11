class Material < ActiveRecord::Base
	attr_accessible :name, :installator_id, :price, :version, :installer_version,:price_description, :description,:preview,:features, :release, :created_at, :updated_at, :release,:releases_attributes
	validates_length_of :preview, :maximum=>200
	has_attached_file :release
	has_many :lic_keys
	belongs_to :installator
	#before_destroy :delete_releases
	#private
	#def delete_releases
	#	self.release.destroy
	#end
end