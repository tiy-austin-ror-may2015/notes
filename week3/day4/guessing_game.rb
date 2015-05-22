# This is my "Functional" version of the guessing game assignment
# What I have done is the following:
#   - Use modules as namespaces to logically group my functions (methods)
#   - No instance variables (or Ivars, as ruby calls them)
#   - Deal only with direct data types (notice I created no classes and don't call .new anywhere)
#     - Strings, Fixnums, and Arrays are sometimes called Primitives in this context
#   - I made sure every method returns a value and/or takes an argument
#   - All of my functions that deal with printing or getting input have been put into a single module
#   - I used recursion (by calling the same method I am within) instead of looping
module Game
  module GuessingRules
  # Any function that deals with the rules of the guessing game belong here
    MAX_GUESSES = 5
    # ^ 'Magic Numbers' are considered bad.
    # A magic number is any number that is important to how the program works,
    # but that is never given a name. Using a constant solves that problem.
    # It also D.R.Y.s up the code.

    def self.guesses_left(guesses)
      MAX_GUESSES - (guesses.length - 1)
    end

    def self.too_many?(guesses)
      guesses.length > MAX_GUESSES
    end

    #Everytime I check a guess I need to give it the number and all the previous guesses
    def self.check_guess(number, guesses)
      guess = guesses.last
      return IO::WHAT if already_asked?(guesses, guess)
      return IO::HIGH if too_high?(guess, number)
      return IO::LOW  if too_low?( guess, number)
      return IO::WIN  if winner?(  guess, number)
    end

    private
    def self.already_asked?(guesses, guess)
      guesses.select { |x| x == guess }.length > 1
    end

    # All of these private 'helper methods' may seem silly,
    # but I enjoy how much more readable they made the check_guess function
    # This also allows me to change what qualifies a number as being too high
    # or too low in a single spot. Making my whole system adhear to SRP better.
    def self.too_high?(guess, number)
      guess > number
    end

    def self.too_low?(guess, number)
      guess < number
    end

    def self.winner?(guess, number)
      guess == number
    end
  end

  module IO
    #Every string in my system exists in this module
    #This is also the only place in my system that
    #calls puts or gets. This makes the rest of the system
    #much easier to test. It is a seperation of concerns.
    WIN  = "Winner!"
    LOW  = "Too Low"
    HIGH = "Too High"

    WHAT = "You Guessed That Already @___@"

    PROMPT = '[Chances: %s] Guess a number > '
    LAST_PROMPT = '[LAST CHANCE] Make your final guess > '

    def self.get_prompt(remaining_guesses)
      if remaining_guesses == 1
        LAST_PROMPT
      else
        PROMPT % remaining_guesses
        #This is an uncommon way of doing string interpolation in ruby
        # If you look at PROMPT it has %s in it, I'm saying put remaining_guesses
        # where %s in the string. I almost used gsub here instead, but this worked.
      end
    end

    def self.get_int_from_input
      gets.chomp.to_i
    end

    def self.put_msg(msg)
      puts msg
    end

    # in case you forgot. puts adds a new line. print is on the same line

    def self.print_msg(msg)
      print.msg
    end
  end

  def self.start(number, guesses = [])
    return if GuessingRules.too_many?(guesses) # Guard Clause

    #Another common pattern in functional style programming is nesting or chaining.
    #This would be an example of nesting
    IO.print_msg(IO.get_prompt(GuessingRules.guesses_left(guesses)))

    guesses.push(IO.get_int_from_input) # Our one bit of state that is being 'mutated' or changed

    answer = GuessingRules.check_guess(number, guesses)

    IO.put_msg(answer)

    return if answer == IO::WIN # Leave if we have won
    start(number, guesses) #Call myself again with the existing guess and the array of guesses (which now has the most recent guess in it)
  end
end

Game.start(rand(1..100))

# get the number from the user
# if its too low have them guess again
# if its too high have them guess again
# after 5 guesses they lose
# if they guess it they win
# if they guess the same number twice. They dumb
