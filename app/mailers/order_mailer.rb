#encoding: utf-8
class OrderMailer < ActionMailer::Base
	def req_order(order, data)
		@order=order	
		mail(:from=>data.deliver_email,:to=>order.email, :subject=>"Ваш заказ на ЛОФТ")
		
	end
	def req_admin_order(order,data)
		@order=order
		mail(:from=>data.deliver_email,:to=>data.deliver_email, :subject=>"Пользователь #{order.user.email} оформил договор")
	end
end