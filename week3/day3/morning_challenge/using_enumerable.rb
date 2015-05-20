require 'test/unit'
# Directions:
#
# Write a series of methods which use the .any, .all, .map, .select, .reject, and .reduce
# methods in Enumerable.
# In this challenge, names longer than 5 characters are # considered long.


# WRITE YOUR CODE BELOW HERE.

def has_even?(arr)
  arr.any? do |number|
    number.even?
  end
end

def all_short?(arr)
  arr.all? { |name| name.length <= 5 }
end

def squares(arr)
  arr.map { |number| number * number }
end

def just_short(arr)
  arr.select { |name| name.length <= 5 }
end

def no_long(arr)
  arr.reject { |name| name.length > 5 }
end

def sum(arr)
  arr.reduce(0) do |accumulator, number|
    accumulator + number
  end
end

def product(arr)
  arr.reduce(1) do |accumulator, number|
    accumulator * number
  end
end

# WRITE YOUR CODE ABOVE HERE.

class EnumerableChallenge < Test::Unit::TestCase
  NOT_TRUE_MSG  = 'Method should have returned TRUE and did not'
  NOT_FALSE_MSG = 'Method should have returned FALSE and did not'
  NOT_EQUAL_MSG = 'Method should have returned the expected value, but returned something else instead. Check your return value.'

  def test_any
    assert has_even?([2, 3, 4, 5, 6]),    NOT_TRUE_MSG
    assert has_even?([-2, 3, -4, 5, -6]), NOT_TRUE_MSG
    refute has_even?([3, 5]),             NOT_FALSE_MSG
    refute has_even?([-3, -5]),           NOT_FALSE_MSG
  end

# Uncomment each test after the one before it passes
 def test_all
   assert all_short?(["Amy", "Bob", "Cam"]),       NOT_TRUE_MSG
   assert all_short?(["Zeke", "Yoo", "Xod"]),      NOT_TRUE_MSG
   refute all_short?(["Amy", "Bob", "Cammie"]),    NOT_FALSE_MSG
   refute all_short?(["Zachary", "Yoo", "Xod"]),   NOT_FALSE_MSG
 end

  def test_map
    assert_equal [1, 4, 9], squares([1, 2, 3]),    NOT_EQUAL_MSG
    assert_equal [16, 36, 81], squares([4, 6, 9]), NOT_EQUAL_MSG
  end

 def test_select
   assert_equal ["Amy", "Bob", "Cam"], just_short(["Amy", "Bob", "Cam"]),   NOT_EQUAL_MSG
   assert_equal ["Zeke", "Yoo", "Xod"], just_short(["Zeke", "Yoo", "Xod"]), NOT_EQUAL_MSG
   assert_equal ["Amy", "Bob"], just_short(["Amy", "Bob", "Cammie"]),       NOT_EQUAL_MSG
   assert_equal ["Yoo", "Xod"], just_short(["Zachary", "Yoo", "Xod"]),      NOT_EQUAL_MSG
 end

 def test_reject
   assert_equal ["Amy", "Bob", "Cam"], no_long(["Amy", "Bob", "Cam"]),   NOT_EQUAL_MSG
   assert_equal ["Zeke", "Yoo", "Xod"], no_long(["Zeke", "Yoo", "Xod"]), NOT_EQUAL_MSG
   assert_equal ["Amy", "Bob"], no_long(["Amy", "Bob", "Cammie"]),       NOT_EQUAL_MSG
   assert_equal ["Yoo", "Xod"], no_long(["Zachary", "Yoo", "Xod"]),      NOT_EQUAL_MSG
 end

 def test_reduce_sum
   assert_equal 3, sum([1, 1, 1]),     NOT_EQUAL_MSG
   assert_equal 18, sum([3, 5, 10]),   NOT_EQUAL_MSG
   assert_equal 31, sum([18, 13, 0]),  NOT_EQUAL_MSG
   assert_equal 7, sum([2, 3, 2]),     NOT_EQUAL_MSG
 end

 def test_reduce_product
   assert_equal 1, product([1, 1, 1]),    NOT_EQUAL_MSG
   assert_equal 150, product([3, 5, 10]), NOT_EQUAL_MSG
   assert_equal 0, product([18, 13, 0]),  NOT_EQUAL_MSG
   assert_equal 12, product([2, 3, 2]),   NOT_EQUAL_MSG
 end
end
