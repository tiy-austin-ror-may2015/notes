log_data[1]
log_data.first
first_row = log_data.first
first_row
first_row.Destination
first_row["Destination"]
first_row["What got shipped"]
first_row[:Destination]
row["Destination"]
log_data.map do |row|
row["Money we made"]
log_data.map { |row| row["Money we made"] }
monies = log_data.map { |row| row["Money we made"] }
monies.reduce(:+)
monies.to_i.reduce(:+)
monies.map { |money| money.to_i }.reduce(:+)
total_money = monies.map { |money| money.to_i }.inject(:+)
log_data.map { |row| row["Money we made"].to_i }
total_money = log_data.map { |row| row["Money we made"].to_i }.reduce(:+)
total_money
log_data.each do |row|
log_data.select { |row| row["What got shipped"] == "Pizza" }
pizza_rows = _
pizza_rows.map { |row| row["Money we made"].to_i }.reduce(:+)
def total_money_made_for(rows)
rows.map { |row| row["Money we made"].to_i}.reduce(:+)
total_money_we_made(log_data)
total_money_we_made_for(log_data)
methods
def foo
:hello
foo
log_data
rows.map { |row| row["Money we made"].to_i }.reduce(:+(
))
def total(rows)
rows.map { |row| row["Money we made"].to_i }.reduce(:+)
total
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
name_csv = CSV.read('names.csv', headers:true)
name_csv.each do |row|
puts row
name_csv.select { |row| row["course"] == 'ruby' }
load 'todo.rb'
Todo.new
Todo.new('todos.csv')
a = _
a.start
is_done?
is_done? = 'foo'
response = gets.chomp
response + "foo"
" ruby code goes -> #{4 + 4} "
my_ride
my_ride = Helicopter.new
my_ride.methods - Object.methods
Helicopter.ancestors
my_heli = HeliCarrier.new
load 'modules_part_deux.rb'
my_heli.refuel
HeliCarrier.ancestors
TonkaTruck
TonkaTruck.ancestors
def unlock_doors
if @admin == true
puts 'unlocked the door'
else
puts 'permission denied'
justin = User.new
justin.unlock_doors
class Admin < User
def initialze
def initialize
@admin = true
Admin
clear
me = Admin.new
me.unlock_doors
module Walking
def walk
puts "moves legs"
include Walk
class User
include Walking
end
justin.walk
exit
