require 'sinatra'
require 'erb'
require_relative "twitter_wrapper"

set :port, 5006
set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
  
  my_tweeter = TwitterWrapper.new("J7yYerIwIOWGH5arYYwezkUcy",
               "S1PBSpVh1hfzY4IODsDRvT9nMcBGZ59pBbSI2yk9c4HiCdzAFv")
  
  @my_tweets = my_tweeter.search("robots", :result_type => "recent").take(10)
  
  @my_name = "Scottbot"
  @some_things = ["burgers", "french frieds", "hash browns"]
  
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
    "<a href='http://www.twitter.com/makeitwithcode'>Make It With Code</a>"
end