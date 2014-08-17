# include the mailgun gem.
require 'mailgun'

Mailgun.configure do |config|
  config.api_key = 'key-8h-lnw7xulidelrhgawtub8lf2oikqj8'
  config.domain  = 'scott@sandbox2c02f80f848447ae8c30bd6f232d1428.mailgun.org'
end

@mailgun = Mailgun()

# or alternatively:
# @mailgun = Mailgun(:api_key => 'key-8h-lnw7xulidelrhgawtub8lf2oikqj8')

parameters = {
  :to => "scott.tj.yu@gmail.com",
  :subject => "Email from a robot",
  :text => "Beep beep...beep..keep programming awesome stuff! Btw, NSA is watching!!",
  :from => "scott@sandbox2c02f80f848447ae8c30bd6f232d1428.mailgun.org"
}
@mailgun.messages.send_email(parameters)
