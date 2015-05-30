Game = Struct.new(:score, :name, :turns)

game = Game.new(1800, "Lord Victarious The Just", 9)

def out(game)
  "#{game.score.to_s(2)}-#{game.turns.to_s(2)}-#{game.name.chars.map(&:bytes).join('-')}"
end

def in_code(game_code)
  code_pieces = game_code.split(/-/)
  {
    score: code_pieces[0].to_i(2),
    turns: code_pieces[1].to_i(2),
    name:  code_pieces[2..-1].map(&:to_i).map(&:chr).join
  }
end

code = out(game)

new_game = in_code(code)

puts game.inspect
puts code
puts new_game
