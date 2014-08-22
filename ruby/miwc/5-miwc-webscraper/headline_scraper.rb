require 'nokogiri'
require 'open-uri'


class HeadlineScraper
# Get a Nokogiri::HTML:Document for the page we’re interested in...

def initialize(url)
  @doc = Nokogiri::HTML(open(url))
end
# Do funky things with it using Nokogiri::XML::Node methods...

####

def get_headlines
 @doc.css('a.title')
end