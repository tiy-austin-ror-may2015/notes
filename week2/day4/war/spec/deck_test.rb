require 'test/unit'
require_relative '../lib/card'
require_relative '../lib/deck'

class CardTest < Test::Unit::TestCase

  def test_card_has_value
    card = Card.new(:hearts, 2)
    assert_equal(2, card.value)
  end

end
