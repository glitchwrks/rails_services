class MessageMailer < ApplicationMailer

  def contact(message)
    @message = message

    mail(
      :from => @message.email,
      :reply_to => @message.email,
      :to => ApplicationSetting.find_by_name('contact_email'),
      :subject => "#{@message.sanitized_subject} (from contact form)",
    )
  end
end
