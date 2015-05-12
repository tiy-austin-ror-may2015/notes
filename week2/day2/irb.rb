message = "my dog takes me to the market every sunday"
message.gsub(/dog/, 'cat')
message.gsub(/[dog]/, 'cat')
message.gsub(/t/, 'cat')
message.gsub(/to/, 'cat')
message.gsub(/t./, 'cat')
message.gsub(/t./, '**')
message.gsub(/.t/, '**')

# Gets always returns a string, so to_i is here to help
age = gets.chomp
age > 100
age.to_i
"justin".to_i
age = gets.chomp.to_i

#using a global val in a loop
$x = 10
animals = ['cat', 'dog', 'fish']
animals.each do |animal|
  puts animal
  puts animals
  puts $x
end

#A method with a loop and a local variable
def puts_food
    food = ['cat', 'dog', 'fish']
    food.each do |food_item|
        puts food_item
    end
end

def foods
['apple', 'pizza', 'icecream']
end

#foods is a method but my_favorite_foods is a variable
my_favorite_foods = foods

#Ruby always returns the last item in a method
def my_name
    "bill"
    "jane"
    "sally"
    "justin"
end
my_name

def print_name(name)
    puts name
end

my_name = "Sally"
puts name

print_name my_name

def square(x)
    x * x
end

square(12)
#writing methods to test that our square method works
def test_square_with_2
    puts square(2) == 4
end
def test_square_with_12
    puts square(12) == 144
end

square(2)
test_square_with_12
test_square_with_2

#See if nil is an object
nil.is_a?(Object)
{}.is_a?(Object)
false.is_a?(Object)
{}.is_a?(Hash)
{}.is_a?(Array)

#What happens to nil when you convert it to another type?
nil.inspect
nil.nil?
nil.to_s
nil.to_i
nil.to_f
nil.to_a
nil.to_h
nil.methods

#Array splicing
a = [1, 2, 3, 4]
a
a[4,0]
a[5,0]
a[6,0]
a[7,0]
a[3,0]
a[2,0]
a[1,0]
a[0,0]
a[0,1]
a[0,2]
a[0,3]
a[0,4]
a[0,5]
a[0,6]
a[2,20]
