# coding: utf-8
NORTH = :north
SOUTH = :south
EAST  = :east
WEST  = :west
SPACE = ' '
STEP_CAP = 40

class Game
  include Display

  def start
    @turn  = 0
    @width = (`tput cols`.chomp.to_i / 3)
    @width = 23 if @width < 23
    system('clear')
    puts "Welcome to IRON WARRIOR"
    @log     = Array.new(5) { '...' } #Replace with logger class
    @warrior = Warrior.new(2, 2, log: @log)
    @player  = Player.new
    @room    = Room.new(8, 3, [@warrior,
                            Entity.new(7, 2, "\033[32m♘\033[m"),
                            Entity.new(8, 3, '☖')])
    @warrior.room = @room
    step
  end

  def step
    loop do
      break if @turn >= STEP_CAP
      @turn += 1
      system('clear')
      print_hud
      @room.print_room(@width)
      puts line
      puts @log.reverse.take(5)
      puts line
      @player.step(@warrior)
      gets #or sleep 1
    end
  end
end
