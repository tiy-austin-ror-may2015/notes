# coding: utf-8
NORTH = :north
SOUTH = :south
EAST = :east
WEST = :west
SPACE = ' '

class Game
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

  def print_hud
    puts line
puts center """ ,-_/          ,.   ,   ,.
'  |,-.,-.,-. `|  /|  /,-.,-.,-..,-.,-.
.- ||  | || |  | / | / ,-||  |  || ||
`--''  `-'' '  `'  `'  `-^'  '  '`-'' """
    puts line

    puts lr_msg("Warrior(#{@warrior.x},#{@warrior.y})", "HP(#{@warrior.health})")
    puts lr_msg("Facing(#{@warrior.facing})", "▲")
    puts lr_msg("Turn ##{@turn}", "N")

    puts line
  end

  def lr_msg(left, right)
    left + (' ' * (@width - (left.length + right.length))) + right
  end

  def center(msg)
    # Omg this is terrifying. Fix me immediately. 😰
    padding = ' ' * (((@width / 2) - (msg.split("\n").first.length / 2)) / 2)
    if (msg_pieces = msg.split("\n"); msg_pieces.length > 1)
      padding + msg_pieces.join("\n" + padding)
    else
      padding + msg
    end
  end

  def line
    '-' * @width
  end

  def step
    loop do
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

  def verify_step
    @warrior.x = 1 if @warrior.x <= 1
    @warrior.y = 1 if @warrior.y <= 1
    @warrior.x = @room.width  if @warrior.x >= @room.width
    @warrior.y = @room.height if @warrior.y >= @room.height
  end
end
