class ProcessMessageService
  def initialize(message)
    @message = message
  end

  def execute
    check_for_html
    send_email

    @message
  end

  private

  def check_for_html
    if @message.contains_html? && ApplicationSetting.find_by_name('save_suspicious_messages')
      @message.suspicious = true
      @message.save!
    end
  end

  def send_email
    MessageMailer.contact(@message).deliver_now
  end
end