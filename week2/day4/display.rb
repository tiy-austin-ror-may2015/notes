def print_board
  sep = '§'
  puts board[0..2].join(sep)
  puts board[3..5].join(sep)
  puts board[6..8].join(sep)
end

def board
  [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

def winning_moves
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6]
  ]
end
    # board = [:x, :x, :x,
    #           4,  5,  6,
    #           7,  8,  9]
    # player = :x
def did_win_game?(board, player)
  # list winning moves - DONE
  # get current board state - DONE
  # get token of player we are checking against? - DONE
  # Compared moves that have been made against the winning moves
  made_moves = []
  board.each_with_index do |space, index|
    if space == player
      made_moves.push(index)
    end
  end
  winning_sets = []
  winning_moves.each do |move_set|
    this_set = []
    move_set.each do |elem|
      this_set.push(made_moves.include?(elem))
    end
    winning_sets.push(this_set.all?)
  end
  winning_sets.any? #
end



