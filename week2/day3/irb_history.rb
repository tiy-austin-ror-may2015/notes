hash[:foo] = :foobar
hash[:foo]
hzxh
hash[:one] = "uno"
hash
hash[:one]
hash[:doesnt_exist]
my_stack = Array.new
my_stack.push(1)
my_stack.push(2)
my_stack.push(3)
my_stack.length
my_stack
my_stack.pop
my_queue = Array.new
my_queue.unshift(1)
my_queue.unshift(2)
my_queue.unshift(3)
my_queue.shift
my_queue.unshift(4)
my_queue.pop
my_queue
my_cat = "Beans"
my_dinner = "Beans"
my_cat.object_id
my_dinner.object_id
my_pet = :cat
my_pet.object_id
your_pet = :cat
my_pet.object_id == your_pet.object_id
:dog
"my_cat".to_sym
clear
class Cat
def initialize(name)
@name = name
def pooping
  puts "*uses litter box"
  def meow
  puts "meow"
def destroy_furniture
puts "*tears up couch*
"
exiit
my_cat = Cat.new('ruby', 18, "1.2 oz")
cat = Cat.new('fluffly', 10, 10)
cat.methods
cat.name = 'fluffy'
cat.name
cat
load 'cat.rb'
my_cat = Cat.new('beans', 12, '12')
my_cat.name
my_cat.age
my_cat.weight
my_cat.weight = 0.1
my_cat
load 'student.rb'
students = [
  Student.new('Sally', 'iOS',      90),
  Student.new('Sue',   'Clojure',  80),
  Student.new('Sarah', 'JS',       70),
  Student.new('Bill',  'Haskell',  10),
  Student.new('Phill', 'Scala',   '98'),
  Student.new('Alex',  'Python',  'ss')
]
students
students.each do |student|
puts student.name
end
ruby_on_rails = Classroom.new
ruby_on_rails.students = [Student.new('foo', 'ruby')]
ruby_on_rails.students
ruby_on_rails
c = Classroom.new('rails', [Student.new('f', 'rails', 2.0), Student.new('g', 'rails')])
c.count
c.class
c.title
c.students
c.average_gpa
load 'lib/student.rb'
load 'lib/classroom.rb'
my_class = Classroom.new('ruby on rails engineering may 2015')
my_class.add_student('Jacob')
my_class.students
my_class.add_student('Sarah')
my_class.add_student('Sally')
my_class.add_student('Joe')
my_class.average_gpa
my_class.students.first
my_class.students.first.gpa
my_class.students.first.gpa = 5.0
my_class.count
my_class.students.count
wzir
Game.new
game_of_war.start
load 'lib/game.rb'
game_of_war = Game.new
exit
