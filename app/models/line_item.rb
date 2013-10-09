class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :material
	attr_accessible :material_id, :quantity, :price, :order_id

	def amount
		unless price.nil? && quantity.nil?
     		 price*quantity
  		end
    end
end