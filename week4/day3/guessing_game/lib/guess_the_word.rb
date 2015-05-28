require_relative '../db/setup'
require_relative 'game'
require_relative 'save'
class GuessTheWord
  MAX_GUESSES = 6
  def initialize
    @word = pick_word
    @correct_guesses = Array.new(@word.length) { '_' }
    @guesses_left = MAX_GUESSES
    @save = Save.new
    start_game
  end

  def pick_word
   words = %w(ruby rails rake bundler gem migration sqlite SELECT WHERE FOOBAR convention over configuration)
   words.sample.downcase
  end

  def start_game
    puts "You have won #{Game.win_count} times!"
    puts "You have lost #{Game.loss_count} times!"

    puts "You have #{Save.count} saved games. Would you like to resume one?"
    puts "(0) New Game"
    Save.all.each do |save|
      puts "(#{save.id}) #{save.guesses_made}"
    end
    print "Pick the number you'd like to play > "
    response = gets.chomp.to_i

    #If the user choice is greater than 1, find that saved game and set the
    #current game state to equal that save.
    if response > 0
      @loaded_save = Save.find(response)
      @word = @loaded_save.word
      @guesses_left = @loaded_save.guesses_left
      @correct_guesses = @loaded_save.guesses_made.split('~')
    end

    while @guesses_left > 0 do
      print_word

      guess = get_user_guess

      if guess == 'quit'
        puts "Saving and quitting the game"
        save!
        exit
      end

      if check_guess_is_in_word?(guess)
        add_guess_to_correct(guess)
      else
        @guesses_left -= 1
      end
      save!
      check_for_winner
    end
    lost_game
  end

  def save!
    #We cannot save arrays (or hashes) directly into a database field
    #So we need to serialize our array into a string to be saved.
    #More info on advanced serialization in ruby:
    #  http://www.skorks.com/2010/04/serializing-and-deserializing-objects-with-ruby/
    serialized_guesses = @correct_guesses.join('~')
    @save.word = @word
    @save.guesses_left = @guesses_left
    @save.guesses_made = serialized_guesses
    @save.save!
  end

  def print_word
    puts @correct_guesses.join(" ")
  end

  def get_user_guess
    print "[#{@guesses_left}] Guess > "
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
      win_game
    end
  end

  def win_game
    end_game("YOU WIN! The word was #@word", true)
  end

  def lost_game
    end_game("YOU LOST! The word was #@word. SO EASY", false)
  end

  def end_game(msg, win_or_lost)
    puts msg
    Game.create(word: @word, has_won: win_or_lost)

    #Only destroy the saved game if it exists
    if @loaded_save
      @loaded_save.destroy
    end
    #What happens to @save? Does it ever get destroyed?
    #Do we ever have multiple instances of Save running around?

    exit
  end

  #If ruby recieves the Int Signal from the user (Ctrl-c) then run this code
  trap(:INT) {
    exit
  }

  #Whenever the program ends, run this code before exiting.
  at_exit {
    puts "Goodbye"
  }
end

GuessTheWord.new
