names = %w(bill bob phil sally sarah sue)
friends = %w(sarah bob)
names - friends
friends - names

require 'csv'
CSV
#Reading from a CSV file with headers
log_data = CSV.read('logs.csv', headers: true)
log_data[2]
log_data[3]
#Accessing data from a read csv file like it is an array

#log_data.last <-- Will throw an error

#Debugging in Ruby
# Getting the class and available methods for any variable
log_data.class
log_data.methods
log_data.methods - Object.methods
(log_data.methods - Object.methods).sort

#Getting the first row from our csv table
first_row = log_data.first

first_row["Destination"]
first_row[:Destination]
#Remember that strings and hashes are seperate keys in ruby

first_row["What got shipped"]

log_data.map do |row|
  row["Money we made"]
end

monies = log_data.map { |row| row["Money we made"] }
total_money = monies.map { |money| money.to_i }.reduce(:+)
total_money = monies.map { |money| money.to_i }.inject(:+)

total_money = log_data.map { |row| row["Money we made"].to_i }.reduce(:+)

pizza_rows = log_data.select { |row| row["What got shipped"] == "Pizza" }
pizza_rows.map { |row| row["Money we made"].to_i }.reduce(:+)

def total(rows)
  rows.map { |row| row["Money we made"].to_i }.reduce(:+)
end

total(log_data)
total(pizza_rows)
total(log_data.select { |row| row["What got shipped"] == "Whiskey" })

CSV.open('names.csv', 'w+') do |csv|
  csv << ['john doe']
  csv << ['jane smith']
  csv << ['foo bar']
name_csv = _
name_csv
name_csv.save

CSV.open('names.csv', 'w') do |csv|
  csv << ["name", "age", "course"]
  csv << ["jane doe", "99", "ruby"]
  csv << ["john smith", "99", "js"]
end

name_csv = CSV.read('names.csv', headers:true)
name_csv.each do |row|
  puts row
end

name_csv.select { |row| row["course"] == 'ruby' }
