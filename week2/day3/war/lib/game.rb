

class Game

  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @player_one.deck = Deck.new
    @player_two.deck = Deck.new
    @player_one.name = "You"
    @player_two.name = "AI"
  end

  def start
    puts "Welcome to the game of War"

    loop do
      system('clear')
      player_one_card = @player_one.draw
      player_two_card = @player_two.draw

      puts "Player one: #{@player_one.score}"
      puts "Player two: #{@player_two.score}"
      puts @player_one.name, player_one_card.display
      puts @player_two.name, player_two_card.display

      evaluate_hand(player_one_card, player_two_card)

      print "Enter to Play Card"
      gets
      break if @player_one.deck.count.zero?
    end

    announce_winner
    game_over
  end

  def evaluate_hand(first_card, second_card)
    #if value is greater, that card wins.
    #if there is a tie second player wins, lol
    if first_card.value > second_card.value
      puts "first card wins"
      @player_one.score += 1
    else
      puts "second card wins"
      @player_two.score += 1
    end
  end

  def announce_winner
    if @player_one.score >= @player_two.score
      puts "Player one wins with #{@player_one.score}!!"
    else
      puts "Player two wins with #{@player_two.score}!!"
    end
  end

  def game_over
    puts "Thanks for playing"
    print "Would you like to play again? (y/n) > "
    response = gets.chomp
    if response == 'y'
      @player_one.deck = Deck.new
      @player_two.deck = Deck.new
      @player_one.score = 0
      @player_two.score = 0
      start
    else
      exit
    end
  end
end
