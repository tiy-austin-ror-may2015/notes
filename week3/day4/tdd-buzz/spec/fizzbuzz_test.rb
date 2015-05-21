require "minitest/autorun"

require_relative '../lib/fizzbuzz.rb'
#Always load the file you're testing

class FizzbuzzTest < Minitest::Test

  def test_Fizzbuzz_exists
    assert(Fizzbuzz)
  end

  def test_run_exists
    refute_nil(Fizzbuzz.new.run)
  end

  def test_div_three_returns_fizz_for_three
    assert_equal('fizz', Fizzbuzz.new.div_three(3))
  end

  def test_div_three_returns_four_for_four
    assert_equal(4, Fizzbuzz.new.div_three(4), 'make sure it is not hardcoded')
   #assert_equal(expected_value, actual_value, [message])
  end

  def test_div_three_returns_fizz_for_six
    assert_equal('fizz', Fizzbuzz.new.div_three(6))
  end

  def test_div_five_returns_buzz_for_five
    assert_equal('buzz', Fizzbuzz.new.div_five(5))
  end

  def test_div_five_returns_buzz_for_ten
    assert_equal('buzz', Fizzbuzz.new.div_five(10))
  end

  def test_div_five_returns_four_for_four
    assert_equal(4, Fizzbuzz.new.div_five(4), 'make sure it is not hardcoded')
  end

  def test_div_fifteen_returns_fizzbuzz_for_fifteen
    assert_equal('fizzbuzz', Fizzbuzz.new.div_fifteen(15))
  end

  def test_div_fifteen_returns_fizzbuzz_for_thirty
    assert_equal('fizzbuzz', Fizzbuzz.new.div_fifteen(30))
  end

  def test_run_return_fizzbuzzed_array
    assert_equal([1,2,'fizz',4,'buzz'], Fizzbuzz.new.run(5))
  end


end
