class HomeController < ApplicationController
	def index
		@material = Material.first
		@current_material = @material.nil? ? {:name => "Programm name", :preview => "Programm descrition", :url_to_material => "#"} : 
												@material.serializable_hash.merge(:url_to_material => "/programs_features")
		@url_to_order = current_user ? "/account" : "/registrations_now"
		@clients = Client.last(4)
		@posts = Post.all
		@post = Post.first
	end

	def register_now
		
	end
end
