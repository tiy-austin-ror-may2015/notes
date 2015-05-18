array = ["Zeke", "Yvonne", "Xavier", "Willa", "Victor"]

# found = false
# array.each do |name|
#   if name[0] == "W"
#     found = true
#     break
#   end
# end
found = array.any? {|n| n[0] == "W"}

puts "Does a name start with W? #{found ? "Yes" : "No"}"
puts


# all_strings = true
# array.each do |name|
#   if name.class != String
#     all_strings = false
#     break
#   end
# end
all_strings = array.all? {|n| n.class == String}

puts "Are all strings? #{all_strings ? "Yes" : "No"}"
puts


# lowercase_names = []
# array.each do |name|
#   lowercase_names << name.downcase
# end
lowercase_names = array.map {|n| n.downcase}

puts "Lowercase names: #{lowercase_names}"
puts


# long_names = []
# array.each do |name|
#   long_names << name if name.length > 4
# end
long_names = array.select {|n| n.length > 4}

puts "Long names: #{long_names}"
puts


# names_ending_in_consonants = []
# array.each do |name|
#   names_ending_in_consonants << name unless ["a", "e", "i", "o", "u"].include?(name[-1])
# end
consonant_names = array.reject {|n| ["a", "e", "i", "o", "u"].include?(n[-1])}

puts "Consonant-ending names: #{consonant_names}"
puts




# total_letters = 0
# array.each do |name|
#   total_letters += name.length
# end
total_letters = array.reduce {|n| n.length}

puts "The total number of letters is: #{total_letters}"
