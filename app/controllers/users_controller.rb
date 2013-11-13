# uncoding: utf-8
class UsersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show, :index]
	def account
		@user=current_user
		@order=Order.new
		@products=Material.where('version=?','Полная')
		@demos=Material.where('version=?','Демо')
		download_file
		if request.xhr?
			logger.debug('jslog')
			@perl=params[:perl]
			respond_to do |format|
				format.js
			end
		else
			@perl='question'
			logger.debug('htmllog')
			respond_to do |format|
				format.html   	
            end
        end
	end
end

def download_file
	@materials=[]
	@orders=Order.where(:user_id=>@user.id).where(:status=>'Договор')
	@orders.each do |order|
			unless order.lic_keys.empty?
				order.line_items.each do |item|
					@materials<<item.material
				end
			end
	end
	@materials=@materials.uniq
end