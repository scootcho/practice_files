require 'csv'
require 'nokogiri'
require 'open-uri'



@doc = Nokogiri::HTML(open('http://quizlet.com/19946728/learn-ruby-the-hard-way-keywords-flash-cards/'))

words = Array.new
defs = Array.new

@doc.css('span.qWord.lang-en').each do |word|
  words << word.text
end

@doc.css('span.qDef.lang-en').each do |definition|
  defs << definition.text
end

(0..words.length - 1).each do |index|
  puts words[index]
  puts defs[index]
  puts ""
end

CSV.open("quizlet.csv", "wb") do |csv|
	csv << [words, defs]
end


# CSV.open("myfile.csv", "w") do |csv|
#   csv << ["row", "of", "CSV", "data"]
#   csv << ["another", "row"]
#   # ...
# end




# qWord lang-en
# Def lang-en



# the_scraper = HeadlineScraper.new('http://www.reddit.com/r/ruby')

# CSV.open("reddit_headline.csv", "wb") do |csv|  
#     the_scraper.get_headlines.each do |line|
#         csv << [line.text, line['href']]
#     end
# end  