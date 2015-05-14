require 'test/unit'
require_relative './display'


class BoardTest < Test::Unit::TestCase

  def test_board_has_winner
    board = [:x, :x, :x,
              4,  5,  6,
              7,  8,  9]

    result = did_win_game?(board, :x)

    assert_equal(true, result)
  end

  def test_board_has_no_winner
    board = [:x, :x, :x,
              4,  5,  6,
              7,  8,  9]

    result = did_win_game?(board, :o)

    assert_equal(false, result)
  end

  def test_board_has_winner_diag
    board = [:x,   2,   3,
              4,  :x,   6,
              7,   8,  :x]

    result = did_win_game?(board, :x)

    assert_equal(true, result)
  end

  def test_board_has_winner_diag
    board = [:x,  :x,   3,
              4,  :x,   6,
              7,   8,  :x]

    result = did_win_game?(board, :x)

    assert_equal(true, result)
  end

end
