class ProcessMessageService
  def initialize(message)
    @message = message
  end

  def execute
    if @message.spammy?
      save_failed_message
    else
      check_for_html
      send_email
    end

    @message
  end

  private

  def save_failed_message
    if ApplicationSetting.find_by_name('save_failed_messages')
      @message.failed = true
      @message.save!
    end
  end

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