require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = "J7yYerIwIOWGH5arYYwezkUcy"
  config.consumer_secret = "S1PBSpVh1hfzY4IODsDRvT9nMcBGZ59pBbSI2yk9c4HiCdzAFv"
  config.access_token = '22341638-q0dYoV9kcoFJG9WytaK6LhKkOtlqzRIjlh1n8bzzJ'
  config.access_token_secret = 'qajjoOEo4AXxKQAAx8nWukZfV9x9mo9puRPmeutc0MG3E'
end

search_term = URI::encode('#todayilearned')  #search_term is passed to tweets

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")  

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end