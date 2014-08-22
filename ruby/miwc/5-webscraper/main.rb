require_relative 'headline_scraper'

the_scraper = HeadlineScraper.new('http://www.reddit.com/r/ruby')

the_scraper.get_headlines.each { |line| puts line }