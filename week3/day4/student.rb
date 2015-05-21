class Student
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  #In ruby you can define your own operators in your class
  def ==(other)
    if other.is_a?(Student)
      if other.name == self.name
        return true
      else
        return false
      end
    else
      return false
    end
  end
  # The method above is long to be explicit about what is being returned at each step
  # The same method could be made much shorter by writing it like below.
# def ==(other)
#   other.is_a?(Student) && other.name == name
# end

end
