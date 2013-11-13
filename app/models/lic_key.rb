class LicKey < ActiveRecord::Base
	belongs_to :material
	belongs_to :order
	attr_accessible :material_id, :order_id, :lic, :status, :material
end