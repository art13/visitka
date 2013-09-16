class ProgramsFeature < ActiveRecord::Base
	belongs_to :material
	attr_accessible :title, :description, :material_id
end