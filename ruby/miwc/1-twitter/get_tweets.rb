# load the third party code, in about 99%
# of cases, this is the same as the gem
# name
require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "key"
  config.consumer_secret = "secret"
end

# # twitter handle to get tweets for
# the_twitter_handle = "scootcho"

# # go through each tweet and print out the text
# client.user_timeline(the_twitter_handle).each do |tweet|
#     puts tweet.text
# end; nil

client.search("learn to code", :result_type => "recent").take(10).each do |tweet|
  puts tweet.text
end
