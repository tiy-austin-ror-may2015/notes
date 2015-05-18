## Testing in Ruby

### Getting Started
Tests are written in their own files and are run separately from the 'production code' of the system that does the actual work. To use the built in testing framework that comes in ruby, you have to write your test files to follow this pattern.

``` rb
require 'test/unit'

#The class name should be the name of the class you are testing followed by Test
class MyClassTest < Test::Unit::TestCase

  #The method name be the method you are testing and what you are expecting
  def my_test_method_returns_5
  end
  
end
```

###Writing a Test
When writing a test, you want to follow a few guidelines. Each test needs to setup a situation in your code. Then it needs to act on that situation and `assert` a result. This style is usually referred to as a 'Given', 'When', 'Then' style of testing.

``` rb
  def test_greater_than_five_returns_true
    my_num = 10 #GIVEN (my_num is 10)
    result = greater_than_five?(my_num) #WHEN greater_than_five? is called with my_num
    assert_equal(true, result) #THEN expect that the result of calling our method should return true
  end
```

### Using Assertions
Assertions are making a statement about your code that must be true for the test to pass. The assertions you'll be using most often are.

  - `assert(truthy_value)`
  - `assert_equal(expected_value, actual_value)`
  - `assert_not_nil(not_nil_value)`
  - `assert_raise(ErrorClassName) do end`

You can read the full list [here](http://ruby-doc.org/stdlib-2.1.2/libdoc/test/unit/rdoc/Test/Unit/Assertions.html#method-i-assert_raise)

### Running Tests
To run your tests simply pass the name of the file to ruby: `ruby spec/card_test.rb` and you'll be able to see the ouput.

### Resources
  - http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing
  - http://learnrubythehardway.org/book/ex47.html
  - http://c2.com/cgi/wiki?TestDrivenDevelopment
  - http://luizricardo.org/wordpress/wp-content/upload-files/2014/05/tdd_flow.gif
  - https://github.com/garora/TDD-Katas
