require 'mailgun'
require 'csv'
require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "J7yYerIwIOWGH5arYYwezkUcy"
  config.consumer_secret = "S1PBSpVh1hfzY4IODsDRvT9nMcBGZ59pBbSI2yk9c4HiCdzAFv"
end


CSV.open("tweet_result.csv", "wb") do |csv|
    client.search("learn to code", :result_type => "recent").take(10).each do |tweet|
        csv << [tweet.text]
    end
end

tweets = File.open("tweet_result.csv")


Mailgun.configure do |config|
  config.api_key = 'key-8h-lnw7xulidelrhgawtub8lf2oikqj8'
  config.domain  = 'sandbox2c02f80f848447ae8c30bd6f232d1428.mailgun.org'
end

@mailgun = Mailgun()

parameters = {
  :to => "scott.tj.yu@gmail.com",
  :subject => "Email from a robot",
  :text => "Beep beep...beep..keep programming awesome stuff! Btw, NSA is watching!!",
  :from => "scott@sandbox2c02f80f848447ae8c30bd6f232d1428.mailgun.org",
  :attachment => File.new(tweets)
}
@mailgun.messages.send_email(parameters)
