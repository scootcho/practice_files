# include the mailgun gem.
require 'mailgun'

Mailgun.configure do |config|
  config.api_key = 'key'
  config.domain  = 'scott@sandbox12345.mailgun.org'
end

@mailgun = Mailgun()

# or alternatively:
# @mailgun = Mailgun(:api_key => 'key-8h-lnw7xulidelrhgawtub8lf2oikqj8')

parameters = {
  :to => "scott@robot.com",
  :subject => "Email from a robot",
  :text => "Beep beep...beep..keep programming awesome stuff! Btw, NSA is watching!!",
  :from => "scott@sandbox12345.mailgun.org"
}
@mailgun.messages.send_email(parameters)
