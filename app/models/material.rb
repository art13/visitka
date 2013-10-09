class Material < ActiveRecord::Base
	attr_accessible :name, :price, :version ,:price_description, :description,:preview,:features, :release, :created_at, :updated_at, :release,:releases_attributes
	validates_length_of :preview, :maximum=>200
	has_attached_file :release
	#before_destroy :delete_releases

	#private
	#def delete_releases
	#	self.release.destroy
	#end
end