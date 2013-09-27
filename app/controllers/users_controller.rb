class UsersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show, :index]
	def account
		@user=current_user
		@demos=Release.where('demo=?',true)
	end
end