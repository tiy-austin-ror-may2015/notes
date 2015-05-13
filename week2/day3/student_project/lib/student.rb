class Student
  attr_accessor :name, :gpa
  attr_reader :course

  def initialize(name, course, gpa = 0.0)
    @name = name
    @course = course
    @gpa = gpa
  end

  def turn_in_homework
    "Turns in homework"
  end

  def go_to_class
    "Goes to class"
  end

  def learn
    "Learned +1!"
  end
end
