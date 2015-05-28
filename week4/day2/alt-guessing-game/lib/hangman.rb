require_relative '../db/setup'
require_relative 'score'
class Hangman
  MAX_GUESSES = 10

  def initialize
    @word            = "foobar" #pick_word
    @guesses_left    = MAX_GUESSES
    @guessed_letters = Array.new
    @correct_letters = Array.new(@word.length) { '_' }
    @name = get_name
    @score = Score.new(name: @name)
    start_game
  end

  def pick_word(min = 2, max = 6)
    File.read('/usr/share/dict/words')
        .split("\n")
        .select { |word| word.length > min && word.length < max }
        .sample
  end

  def get_name
    print "What is your name? > "
    gets.chomp.downcase
  end

  def start_game
    scores = Score.where(:name => @name)
    games_won, games_lost = scores.partition { |x| x.won_game }
    puts "Welcome Justin, your score history"
    puts "Wins #{games_won.count}, Loses #{games_lost.count}"
    while @guesses_left >= 0 do
      puts "Guess a letter"
      puts "Guessed Letters: #{@guessed_letters.join(' ')}"
      puts "Word: #{@correct_letters.join(' ')}"
      print "> "
      input = gets.chomp.chars.first # Only use the first character
      add_guess(input)
      check_for_winner
      @guesses_left -= 1
    end
    @score.won_game = false
    @score.save!
    puts "I'm sorry, you lost.", "The word was #{@word.inspect}."
  end

  def add_guess(input)
    if @word.chars.include?(input)
      get_char_indexes_from_word(input).each do |index_of_char|
        puts index_of_char
        @correct_letters[index_of_char] = input
      end
    end
    @guessed_letters << input
  end

  def check_for_winner
    if @word.chars == @correct_letters
      puts "YOU WIN!", "The Word Was #{@word}. You got it!"
      @score.won_game = true
      @score.save!
      exit
    end
  end

  private
  def get_char_indexes_from_word(input)
    @word.chars
         .map
         .with_index { |char, index| index if char == input }
         .compact
  end

end
Hangman.new
