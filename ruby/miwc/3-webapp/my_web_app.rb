require 'sinatra'
require 'erb'


# replace YOUR_PORT with your MIWC public port
set :port, 5006

# allow external access (e.g. you can access from http://yourusername.ide.makeitwithcode.com:YOUR_PORT)
set :bind, '0.0.0.0'

get '/' do
  @my_name = "Scottbot!"
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
    "You can find us on Twitter! http://www.twitter.com/makeitwithcode"
end

get '/my_page' do
    "This page is all about me!"
end

get '/robots!' do    #action name (doesn't have to be the same as template name)
  @robot_do = "HUNGRY"  #assigning instance variable
  erb :robots, layout: :bootstrap
end