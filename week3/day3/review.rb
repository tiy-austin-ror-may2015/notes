names = %w(alice bob sally sue bob bill cindy sue)

uniq_names = names.reduce([]) do |array, name|
  if array.include?(name)
    array
  else
    array.push(name)
  end
end

uniq_names = names.reduce([]) do |array, name|
  array.include?(name) ? array : array.push(name)
end
# puts uniq_names


# def wrap
#   puts "---------------------"
#   puts yield
#   puts "---------------------"
# end

# wrap do
#   "Yay I'm safe in these lines"
# end

def with_num
  ran_num = rand(1..10)
  # yield(ran_num, "Weird huh?")
end

with_num do |x, msg|
  puts "The number #{x} is so random"
  puts msg
end

# Only works with collections of length 4
def each(collection)
  yield(collection.first)
  yield(collection[1])
  yield(collection[2])
  yield(collection[3])
end

# each([1,2,3,4]) do |element|
#   puts element.inspect
# end

# Only works with collections of length 4
def each_with_index(collection)
  yield(collection[0], 0)
  yield(collection[1], 1)
  yield(collection[2], 2)
  yield(collection[3], 3)
end

# # Only works with collections of length 4


def each_any_size(collection)
  length = collection.length
  (0..length).times do |i|
    yield(collection[i])
  end
end

# Method with no arguments. (Arity of 0)
def name
  "Justin"
end

# puts name

# Method with 1 argument. (Arity of 1)
def greet(persons_name)
  "Hello! #{persons_name}"
end

# puts greet("Sally")


# Method with 2 arguments. (Arity of 2)
# Second arguments has a default value of 'Baron'
def salutations(persons_name, title = "Baron")
  "It is an honor to meet the #{title} #{persons_name}"
end

# puts salutations('Sarah')
# puts salutations('Steve', 'Czar')


nums = [1,2,3,4,5]

nums.map do |num|
  num.succ
end

# JAVASCRIPT @_@
# [1, 2, 3, 4, 5].map(function(x) {
#     return x + 1;
# })

# Return me a copy of the original array with
# Increment each number in the array.
# Then keep only the even numbers.
puts [1, 2, 3, 4, 5].map    { |x| x.succ  }
                    .select { |x| x.even? }

#The following is functionally identical to above.
# (probably easier to read tho)
nums = [1, 2, 3, 4, 5]
successor_nums = nums.map { |x| x.succ  }
even_nums = successor_nums.select { |x| x.even? }
puts even_nums


predicate = true

if predicate
  # as much as you want
  # can go
  # here
else
  # and here
end

#Ranges can be asked if they contain a number
(1..100).member?(10)


#You can use ranges inside of case statements
response = 45
case response
when 1..10  then "Too low"
when 11..20 then "Nope"
when 100..10000 then "Whoa now"
else
  "huh"
end

def its_a_good_time_for_you
  true
end


def forever
  loop do
    puts 'this is the song that never ends'
    break if its_a_good_time_for_you
  end
end

forever

#Values in ruby can be coerced into true and false
!!"my string" #=> true
# Every value in ruby besides false and nil are true or 'truthy'


student = {
  :name   => "Jacob M",
  :age    => 40,
  :course => 'Ruby',
  :foods  => [
    :apples,
    :pears,
    :lettuce
  ]
}
#Alternative Syntax
# student = {
#   name: 'Jacob M',
#   age: 40,
#   course: 'Ruby'
# }

#=>
#Hashrocket means 'return value'

student[:name] #=> 'Jacob M'
student[:foods].last #=> :lettuce


STUDENTS = [
    {
      :name   => "Jillian",
      :age    => 35,
      :course => 'Ruby',
      :foods  => [
        :apples,
        :fries,
        :cheese
      ]
    },
    {
    :name   => "Jacob M",
    :age    => 40,
    :course => 'Ruby',
    :foods  => [
      :apples,
      :pears,
      :lettuce
    ]
  }
]
STUDENTS[1][:foods].last

def print_students_with_foods
  STUDENTS.each do |student|
    puts student[:name]
    student[:foods].each do |food|
      puts "\t #{food}"
    end
  end
end

abcs = {
  :a => 'Apple',
  :b => 'Boy',
  :c => 'Cat'
}

improved_abcs = abcs.merge({:b => 'Baron', :d => 'Dog'})

improved_abcs.each do |key, value|
  puts "#{value} is the value for #{key}"
end

puts abcs.keys.inspect
puts abcs.values.inspect

improved_abcs[:a] = 'Ant'

puts improved_abcs

