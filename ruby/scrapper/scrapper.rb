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
	csv << ["WORD", "DEFINITION"]
  csv << ["", ""]

	(0..words.length - 1).each do |index|
	  csv << [ words[index], defs[index] ]
  end
end

