# encoding: utf-8
class LicKeyMailer < ActionMailer::Base
	def keygen(order, data)
		@order=order
		@data=data
		mail(:from=>data.deliver_email, :to => order.email, :subject=> "ооо'ЛОФТ' лицензионные ключи")
	end

end