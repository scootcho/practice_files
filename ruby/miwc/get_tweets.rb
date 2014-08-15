# load the third party code, in about 99%
# of cases, this is the same as the gem
# name
require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "J7yYerIwIOWGH5arYYwezkUcy"
  config.consumer_secret = "S1PBSpVh1hfzY4IODsDRvT9nMcBGZ59pBbSI2yk9c4HiCdzAFv"
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