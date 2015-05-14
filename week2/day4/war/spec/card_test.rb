require 'test/unit'
require_relative '../lib/card'

class CardTest < Test::Unit::TestCase

  def test_card_has_value
    card = Card.new(:hearts, 2)
    assert_equal(2, card.value)
  end

  def test_card_has_other_value
    card = Card.new(:hearts, 3)
    assert_equal(3, card.value)
  end

  def test_card_has_suit
    card = Card.new(:hearts, 2)
    assert_equal(:hearts, card.suit)
  end

  def test_card_has_other_suit
    card = Card.new(:spades, 3)
    assert_equal(:spades, card.suit)
  end
end
