require 'mailgun'
require 'csv'
require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "key"
  config.consumer_secret = "secret"
end


CSV.open("tweet_result.csv", "wb") do |csv|
    client.search("learn to code", :result_type => "recent").take(10).each do |tweet|
        csv << [tweet.text]
    end
end

tweets = File.open("tweet_result.csv")


Mailgun.configure do |config|
  config.api_key = 'key'
  config.domain  = 'sandbox12345.mailgun.org'
end

@mailgun = Mailgun()

parameters = {
  :to => "scott@robot.com",
  :subject => "Email from a robot",
  :text => "Beep beep...beep..keep programming awesome stuff! Btw, NSA is watching!!",
  :from => "scott@sandbox12345.mailgun.org",
  :attachment => File.new(tweets)
}
@mailgun.messages.send_email(parameters)
