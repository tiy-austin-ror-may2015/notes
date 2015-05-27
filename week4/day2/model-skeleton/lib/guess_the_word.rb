require_relative '../db/setup'
require_relative 'game'

class GuessTheWord
  def initialize
    @word = pick_word
    @correct_guesses = Array.new(@word.length) { '_' }
    start_game
  end

  def pick_word
   words = %w(ruby rails rake bundler gem migration sqlite SELECT WHERE FOOBAR convention over configuration)
   words.sample.downcase
  end

  def start_game
    win_count = Game.all.select { |game| game.has_won == true }.count
    puts "You have won #{win_count} times!"

    Game.all.each do |game|
      puts game.outcome
    end

    loop do
      print_word
      guess = get_user_guess
      if check_guess_is_in_word?(guess)
        add_guess_to_correct(guess)
      else
        # TODO: KEEP TRACK OF GUESSES
      end
      check_for_winner
    end
  end

  def print_word
    puts @correct_guesses.join(" ")
  end

  def get_user_guess
    print 'Guess > '
    gets.chomp.downcase
  end

  def check_guess_is_in_word?(guess)
    @word.include?(guess)
  end

  def add_guess_to_correct(guess)
    indicies = @word.split('')
                    .map.with_index { |char, index| index if char == guess }
                    .compact
    indicies.each do |index|
      @correct_guesses[index] = guess
    end
  end

  def check_for_winner
    if @correct_guesses.all? { |elem| elem != '_' }
      puts "YOU WIN! The word was #@word"

      game = Game.new
      game.word = @word
      game.has_won = true
      game.save!

      exit
    end
  end
end
# - If the guess is in the word
# -  - Add letter to word
# -  - Add guess to missed guesses list, limit of 6
GuessTheWord.new
