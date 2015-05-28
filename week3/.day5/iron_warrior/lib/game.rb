# coding: utf-8
Entity = Struct.new(:x, :y, :char)
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

#  def puts(msg)
#    if msg.is_a?(Array)
#      with_border = msg.push('|')
#    else
#      with_border = "|" + msg + "|"
#    end
#    if with_border.length < @width
#      Kernel.puts with_border[-1] = (' ' * ((@width - with_border.length) - 1)) + '|'
#    else
#      Kernel.puts with_border
#    end
#  end

  def print_room(width, height, entities)
    room   = Array.new(height + 2) { Array.new(width + 2) { SPACE }}
    offset = (@width / 2) - (room.length)
    entities.each do |entity|
      room[entity.y][entity.x] = entity.char
    end
    room.first.fill('▁')
    room.first[ 0] = SPACE
    room.first[-1] = SPACE
    room[1..-2].each do |row|
      row[ 0] = '|'
      row[-1] = '|'
    end
    room.last.fill('▔')
    room.last[0 ] = SPACE
    room.last[-1] = SPACE
    room.each do |row|
      puts "#{' ' * offset}#{row.join}"
    end
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
      print_room(@room.width, @room.height, @room.entities)
      puts line
      puts @log.reverse.take(5).reverse
      puts line
      @player.step(@warrior)
      verify_step
      sleep 1
    end
  end

  def verify_step
    @warrior.x = 1 if @warrior.x <= 1
    @warrior.y = 1 if @warrior.y <= 1
    @warrior.x = @room.width  if @warrior.x >= @room.width
    @warrior.y = @room.height if @warrior.y >= @room.height
  end
end
