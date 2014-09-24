require 'csv'  
require_relative 'headline_scraper'

the_scraper = HeadlineScraper.new('http://www.reddit.com/r/ruby')

CSV.open("reddit_headline.csv", "wb") do |csv|  
    the_scraper.get_headlines.each do |line|
        csv << [line.text, line['href']]
    end
end  