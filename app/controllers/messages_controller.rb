class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_parameters.merge(:address => request.remote_ip))

    if @message.valid? && verify_recaptcha
      processor = ProcessMessageService.new(@message).execute
      redirect_to success_messages_path
    else
      render :new
    end
  end

  private 

  def message_parameters
    params.require(:message).permit(:name, :email, :subject, :content)
  end

  def verify_recaptcha
    return true if RecaptchaVerificationService.new(:mailer, params['g-recaptcha-response'], request.remote_ip).execute
    
    @message.errors[:base] << 'CAPTCHA failed, please try again'
    false
  end
end