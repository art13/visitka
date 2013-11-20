# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  #  helper_method :current_order
  # private
  # def current_order
  #  if session[:order_id].nil?
  #     @current_order = current_user.orders.create!
  #     @products=Material.where('version=?','Полная')
  #     # @products.each do |product|
  #     #    @current_order.line_items.create(:material_id=>product.id, :price=>product.price)
  #     # end
  #     session[:order_id] = @current_order.id
  #   end
  #   if session[:order_id]
  #     @current_order ||= current_user.orders.find(session[:order_id])

  #   end
  #   @current_order
  # end

end
