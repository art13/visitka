# uncoding: utf-8
class UsersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show, :index]
	def account
		
		@orders = Order.where(:user_id => current_user.id)
		@user = current_user
		@order = Order.new
		@products = Material.where('version=?','Полная')
		@demos = Material.where('version=?','Демо')
		download_file
		if request.xhr?
			@perl = params[:perl]
			respond_to do |format|
				format.js
			end
		else
			@perl = 'question'
			respond_to do |format|
				format.html   	
            end
        end
	end
end

def download_file
	@materials = []
	@orders = Order.where(:user_id => @user.id).where(:status => 'Договор')
	@orders.each do |order|
		next unless order.lic_keys.empty?
		order.line_items.map{|item| @materials += item.material}.uniq.compact
	end
	return @materials
end