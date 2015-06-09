require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/changer'

# changer(99) #=> [25, 25, 25, 10, 10, 1, 1, 1, 1]
# changer(75) #=> [25, 25, 25]
# changer(14) #=> [10, 1, 1, 1, 1]
# changer(5)  #=> [5]
class ChangerTest < MiniTest::Test
  def test_changer_exists
    assert(changer(10))
  end

  def test_75_returns_3_quarters
    assert_equal([25, 25, 25], changer(75))
  end

  def test_50_returns_2_quarters
    assert_equal([25, 25], changer(50))
  end

  def test_2_dimes_returned_for_20
    assert_equal([10, 10], changer(20))
  end

  def test_1_nickle_for_5
    assert_equal([5], changer(5))
  end

  def test_4_pennies_for_4
    assert_equal([1, 1, 1, 1], changer(4))
  end

  def test_dimes_and_pennies_with_14
    assert_equal([10, 1, 1, 1, 1], changer(14))
  end

  def test_it_works
    expected = changer(99)
    actual = [25, 25, 25, 10, 10, 1, 1, 1, 1]
    assert_equal(actual, expected)
  end
end
