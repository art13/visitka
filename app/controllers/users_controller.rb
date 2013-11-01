# uncoding: utf-8
class UsersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show, :index]
	def account
		@user=current_user
		@order=Order.new
		@products=Material.where('version=?','Полная')
		@demos=Material.where('version=?','Демо')
		logger.debug request.format
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