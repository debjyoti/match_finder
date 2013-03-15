class PingMailer < ActionMailer::Base
  default from: "debjyoti.majumder.02@gmail.com"

  def ping_email(pinged_email, pinger_name, pinger_message, pinger_email)
    @pinger_name = pinger_name
    @pinger_message = pinger_message
    @pinger_email = pinger_email
    mail(:to => pinged_email, :subject => "You got pinged")
  end
end
