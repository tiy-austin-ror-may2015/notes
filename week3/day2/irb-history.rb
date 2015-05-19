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
# do/end version and {} version are identical, but {}
# are easier when so short.
monies = log_data.map { |row| row["Money we made"] }
# Getting all the money in the csv table


total_money = monies.map { |money| money.to_i }.reduce(:+)
total_money = monies.map { |money| money.to_i }.inject(:+)
#Getting the sum of all the money in the csv table
# Inject and reduce are identical in behavior.

total_money = log_data.map { |row| row["Money we made"].to_i }.reduce(:+)
#Everythign in one line

pizza_rows  = log_data.select { |row| row["What got shipped"] == "Pizza" }
pizza_total = pizza_rows.map { |row| row["Money we made"].to_i }.reduce(:+)
#Get the sum of all money earned from shipping pizza

#Lets write a method that will sum the money earned from any
#collection of csv rows.
def total(rows)
  rows.map { |row| row["Money we made"].to_i }.reduce(:+)
end

total(log_data)
total(pizza_rows)
total(log_data.select { |row| row["What got shipped"] == "Whiskey" })

#We can open a new file and write to it any any time
#This demonstrates adding 3 rows to a csv file with no headers
CSV.open('names.csv', 'w+') do |csv|
  csv << ['john doe']
  csv << ['jane smith']
  csv << ['foo bar']
end

CSV.open('names.csv', 'w') do |csv|
  csv << ["name", "age", "course"] #this is the header row
  csv << ["jane doe", "99", "ruby"]
  csv << ["john smith", "99", "js"]
end
#This demonstates adding 2 rows to a csv add giving it a header row

name_csv = CSV.read('names.csv', headers:true) #loading a csv with headers
name_csv.each do |row|
  puts row
end

name_csv.select { |row| row["course"] == 'ruby' }
#grab all rows from our csv where the course is ruby
