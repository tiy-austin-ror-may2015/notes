class Classroom
  attr_reader :title
  attr_accessor :students

  def initialize(title, students = [])
    @title = title
    @students = students
  end

  def count
    students.count
  end

  def average_gpa
    gpas = []
    students.each do |student|
      gpas.push(student.gpa)
    end # get the gpa of every student

    sum = 0
    gpas.each do |gpa|
       sum += gpa
    end # sum the gpa numbers together

    sum / count # divide the sum by the amount of students in the class
  end

  def add_student(student_name)
    new_student = Student.new(student_name, @title)
    @students.push(new_student)
  end
end
