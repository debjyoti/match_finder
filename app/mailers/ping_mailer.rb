class PingMailer < ActionMailer::Base
  default from: "gettoknowyu@gmail.com"

  def ping_email(pinged_email, pinger_name, pinger_message, pinger_email, pinger_profile_url)
    @pinger_name = pinger_name
    @pinger_message = pinger_message
    @pinger_email = pinger_email
    @pinger_profile_url = pinger_profile_url
    mail(:to => pinged_email, :subject => "You got pinged")
  end
end
