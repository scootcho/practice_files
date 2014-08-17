require 'csv'

CSV.open("my_results.csv", "wb") do |csv|
  csv << ["firstname", "lastname", "phone", "email"]
  csv << ["scott", "yu", "888-8888", "scott@robots.com"]
  # ...
end

