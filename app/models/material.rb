class Material < ActiveRecord::Base
	has_many :releases
	accepts_nested_attributes_for :releases, :allow_destroy =>true
	attr_accessible :name, :description,:preview,:features, :releases, :created_at, :updated_at, :release,:releases_attributes
	validates_length_of :preview, :maximum=>200
end