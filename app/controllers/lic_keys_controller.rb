class LicKeysController < ApplicationController
	def create
		@data = DataContact.first
		@order = Order.find(params[:order_id])
		@order.line_items.each do |item|
			q = item.quantity
			q.times do
				get_params(@order, item)
			end
		end
		LicKeyMailer.delay.keygen(@order, @data)
		render :js => "window.location = '/admin/orders/#{@order.id}'"		
	end
	def update_key
		@order = Order.find(params[:order_id])                                                                                                                
		@key = LicKey.find(params[:key_id])
		get_params(@order, @key)
		@key.destroy
		render :js => "window.location = '/admin/orders/#{@order.id}'"
	end

	def get_params(order, key)
		installer_version = @key.material.installer_version.to_s
		user_number = order.number.to_s
		programm_number = key.material.id.to_s
		order_number = order.id.to_s
		number_lic_key = SecureRandom.hex(3)
		number = user_number + order_number + 'x' + programm_number + '-' + installer_version + '-' + number_lic_key
		order.lic_keys.create(:material => @key.material, :status => t('not_active'), :lic => number)
	end
end
