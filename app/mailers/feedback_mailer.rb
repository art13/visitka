class FeedbackMailer < ActionMailer::Base
  default from: "loft.ibesk@gmail.com"
  def message_email(feedback)
  	@feedback=feedback
  	mail(:to=> "loft.ibesk@gmail.com", :subject=> "#{feedback.fio} send message" )  	
  	logger.debug('email_message')
  end

end
