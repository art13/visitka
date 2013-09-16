class Material < ActiveRecord::Base
	has_many :releases
	has_many :programs_features
	accepts_nested_attributes_for :releases, :allow_destroy =>true
	attr_accessible :name, :description, :releases, :created_at, :updated_at, :release,:releases_attributes
end