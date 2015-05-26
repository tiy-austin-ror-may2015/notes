# coding: utf-8
Entity = Struct.new(:x, :y, :char)
NORTH = :north
SOUTH = :south
EAST = :east
WEST = :west
SPACE = ' '

class Room
  attr_accessor :width, :height, :entities
  def initialize(width, height, entities)
    @width = width; @height = height; @entities = entities;
  end
end

class Game
  def start
    @width = (`tput cols`.chomp.to_i / 4)
    system('clear')
    puts "Welcome to IRON WARRIOR"
    @warrior = Warrior.new(2, 2)
    @player  = Player.new
    @room    = Room.new(8, 3, [@warrior,
                            Entity.new(7, 2, '♘'),
                            Entity.new(8, 3, '☖')])
    step
  end

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

    puts lr_msg("Warrior(#{@warrior.x},#{@warrior.y})", "HP(#{@warrior.health})")
    puts lr_msg("Facing(#{@warrior.facing})", "▲")
    puts lr_msg("", "N")

    puts line
  end

  def lr_msg(left, right)
    left + (' ' * (@width - (left.length + right.length))) + right
  end

  def line
    '-' * @width
  end

  def step
    loop do
      system('clear')
      print_hud
      print_room(@room.width, @room.height, @room.entities)
      puts line
      @player.step(@warrior)
      verify_step
      sleep 1
    end
  end

  def verify_step
    @warrior.x = 0 if @warrior.x <= 0
    @warrior.y = 0 if @warrior.y <= 0
    @warrior.x = @room.width  if @warrior.x >= @room.width
    @warrior.y = @room.height if @warrior.y >= @room.height
  end
end

class Player
  def step(warrior)
    warrior.walk!(EAST)
  end
end

class Warrior
  attr_accessor :x, :y, :char, :health, :facing
  def initialize(x, y, char = '😂 ')
    @x = x; @y = y; @char = char; @health = 10; @facing = EAST;
  end
  def walk!(direction)
    @facing = direction.upcase
    case direction
    when NORTH then @y -= 1
    when SOUTH then @y += 1
    when EAST then  @x += 1
    when WEST then  @x -= 1
    end
  end
end
Game.new.start
