#We can define our own custom exceptions to use in our own code
class NotAValidMeasurementType < StandardError
end

class Meter
  def initialize(length = 1)
    @length = length
  end

  #Here we are saying, only add together the two values if they are both Meters
  def +(other)
    if other.is_a?(Meter)
      @length += other.length
    else
      raise NotAValidMeasurementType
      # We use the 'raise' keyword to say our code should break and throw an
      # exception is this happens. We can also give it what type of error should
      # be raised. Here it is an invalid type being given to our method.
      # This is a technique we want to use sparingly.
    end
  end

  def -(other)
    if other.is_a?(Meter)
      @length -= other.length
    else
      raise NotAValidMeasurementType
    end
  end
