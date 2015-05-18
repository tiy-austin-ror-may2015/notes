# - All? [false, false, true].all? #=> false  [true, true].all? #=> true
# my_array = [true, true]
# is_array_all_true = true
# my_array.each do |elem|
#   if elem
#     is_array_all_true = true
#   else
#     is_array_all_true = false
#     break
#   end
# end
# is_array_all_true
[true, true].all?

# - Any?
# my_array = [false, true, false]
# are_any_true = true
# my_array.each do |elem|
#   if elem
#     are_any_true = true
#     break
#   else
#     are_any_true = false
#   end
# end
# are_any_true
[false, true, false].any?

# - None?
# my_array = [false, true]
# are_none_true = true
# my_array.each do |elem|
#   if elem
#     are_none_true = false
#     break
#   else
#     are_none_true = true
#   end
# end
# are_none_true
[false, true].none?

# - Map   map(['a', 'b', 'c']) { |elem| elem.upcase } #=> ['A', 'B', 'C']
# my_array = %w(a b c)
# my_new_array = Array.new
# my_array.each do |elem|
#   my_new_array.push(elem.upcase)
# end
# my_new_array
%w(a b c).map { |elem| elem.upcase }

# - Each With Index
names = %w(bill bob phil sally sarah sam)
# index = 0
# names.each do |name|
#   puts "#{index}) #{name}"
#   index += 1
# end
names.each_with_index do |elem, index|
  puts "#{index}) #{name}"
end

# # - Select
# names = %w(bill bob phil sally sarah sam)
# long_names = []
# names.each do |name|
#   long_names.push(name) if name.length > 3
# end
# puts long_names
long_names = names.select { |name| name.length > 3 }

# - Reject
# names = %w(bill bob phil sally sarah sam)
# short_names = []
# names.each do |name|
#   short_names.push(name) unless name.length > 3
# end
# puts short_names
short_names = names.reject { |name| name.length > 3 }

# - Partition
# names = %w(bill bob phil sally sarah sam)
# short_names = []
# long_names  = []
# names.each do |name|
#   if name.length > 3
#     long_names.push(name)
#   else
#     short_names.push(name)
#   end
# end
long_and_short_names = names.partition { |name| name.length > 3 }

# - Reduce [12, 10, 8, 5, 5] #=> 40
ages = [12, 10, 8, 5, 5]
# sum_of_ages = 0
# ages.each do |age|
#   sum_of_ages += age
# end
# sum_of_ages
sum_of_ages = ages.reduce do |sum, number|
  sum + number
end
sum_of_ages = ages.reduce(:+)



















