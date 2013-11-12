# encoding: UTF-8
class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :material
	attr_accessible :material_id, :quantity, :price, :order_id
	 validates :quantity, numericality: {
      only_integer: true,
      greater_than: -1,
  	  message: 'Количество лицензий должно быть больше 0' }
	def amount
		unless price.nil? && quantity.nil?
     		 price*quantity
  		end
    end
end