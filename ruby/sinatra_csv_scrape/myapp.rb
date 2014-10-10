require 'csv'
require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'erb'

# set :bind, '0.0.0.0'
# set :server, 'webrick'

get '/' do  
  erb :index, layout: :foundation
end

get '/scraper' do
  @scrape = params[:scrape]
	erb :scraper, layout: :foundation
end

post '/scraper' do
  @scrape = params[:scrape][:url]
	erb :done, layout: :foundation

	@doc = Nokogiri::HTML(open("#{@scrape}"))

	@words = Array.new
	@defs = Array.new

	@doc.css('span.qWord.lang-en').each do |word|
	  @words << word.text
	end

	@doc.css('span.qDef.lang-en').each do |definition|
	  @defs << definition.text
	end

	content_type 'application/csv'
	attachment "quizlet.csv"
	csv_string = CSV.generate do |csv|
		csv << ["WORD", "DEFINITION"]
	  csv << ["",""]

		(0..@words.length - 1).each do |index|
		  csv << [ @words[index], @defs[index] ]
	  end
	end
end