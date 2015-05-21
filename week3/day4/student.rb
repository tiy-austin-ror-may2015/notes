class Student
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  #In ruby you can define your own operators in your class
  #When you compare two instances of the same class in ruby,
  #even if they have the same values inside of them. They are not equal.
  #(Card.new == Card.new) will always return false.
  #So we can define our own == method that checks against another object
  #and makes that decision. Here we are asking of that other object is
  #a student. If it is a student we compare names. If the names are the same,
  #then we can say these are the same student. True. If other is not an instance of student
  #or if the name is different, we will say they are not equal.
  def ==(other)
    if other.is_a?(Student)
      if other.name == @name
        return true #return is not needed, but I wanted to explicitly show the control flow here
      else
        return false
      end
    else
      return false
    end
  end
  # The method above is long to be explicit about what is being returned at each step
  # The same method could be made much shorter by writing it like below.
  def ==(other)
    other.is_a?(Student) && other.name == name
  end
end
