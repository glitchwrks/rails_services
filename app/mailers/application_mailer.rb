class ApplicationMailer < ActionMailer::Base
  default :from => 'noreply@glitchwrks.com'
  default :reply_to => 'noreply@glitchwrks.com'
  layout 'mailer'
end
