class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_parameters.merge(:address => request.remote_ip))

    if @message.valid?
      processor = ProcessMessageService.new(@message).execute
      redirect_to success_messages_path
    else
      render :new
    end
  end

  private 

  def message_parameters
    params.require(:message).permit(:name, :email, :subject, :content, :check)
  end
end