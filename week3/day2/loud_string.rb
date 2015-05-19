class LoudString

  def initialize(str)
    @str = str.upcase
  end

  def self.make_loud(str)
    str.upcase + "!"
  end

  def to_s
    @str + "!"
  end
end

loud_string = LoudString.new("hello world")
puts loud_string

my_string = "hi there"
my_made_loud_string = LoudString.make_loud(my_string)

puts my_made_loud_string










