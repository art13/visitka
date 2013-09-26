class FeedbackMailer < ActionMailer::Base
  def message_email(feedback, data)
  	@feedback=feedback
  	@data=data
  	mail(:from=> data.deliver_email, :to=> data.email, :subject=> "#{feedback.fio} send message" )  	
  	logger.debug('email_message')
  end

end
