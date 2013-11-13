class LicKeysController < ApplicationController
	def create
		@order=Order.find(params[:order_id])
		@order.line_items.each do |item|
			q=item.quantity
			q.times do
				user_number=@order.user.id.to_s(16)
				programm_number=item.material_id.to_s(16)
				order_number=@order.id.to_s(16)
				number_lic_key=SecureRandom.hex(3)
				number=user_number+order_number+programm_number+'-'+number_lic_key
				@order.lic_keys.create(:material=>item.material, :status=>t('not_active'), :lic=>number)
			end
		end
		render :js => "window.location = '/admin/orders/#{@order.id}'"
		#:notice => t('generations_end')
		#respond_to do |format|

		#	format.js("window.location = ")
		#end
	end
end