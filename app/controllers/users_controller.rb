# uncoding: utf-8
class UsersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show, :index]
	def account
		@user=current_user
		# if !session[:order_id].nil?
		# 	@order=Order.find(session[:order_id])
		# else
		# 	@order=current_order
		# end
		 @order=Order.new
		@products=Material.where('version=?','Полная')
		@demos=Material.where('version=?','Демо')
		if request.xhr?
			@perl=params[:perl]
			respond_to do |format|
				format.js
			end
		else
			respond_to do |format|
				format.html 
				format.js   	
            end
        end
	end
end