require 'artoo'

connection :leapmotion, adaptor: :leapmotion, port: '127.0.0.1:6437'
device     :leapmotion, driver:  :leapmotion

work do
  on(leapmotion, open:  :on_open)
  on(leapmotion, frame: :on_frame)
  on(leapmotion, close: :on_close)
end

def on_open(*args)
  system('clear')
  puts args.inspect
  puts "Would you like to hand distance (1) or demo gestures (2) ?"
  @response = gets.chomp.to_i
end

def on_frame(*args)
  exit if @response.zero?

  frame = args[1]

  if @response == 1
    frame.hands.each_with_index do |hand, index|
      color_for_hand = get_color(index)
      display_hand(hand.palm_z.to_i, color_for_hand)
    end
    frame.pointables.each_with_index do |pointable, index|
      display_hand(pointable.tip_position[1], get_color(index + 1))
    end
  end

  if @response == 2
    frame.gestures.group_by(&:class).each do |gesture_type|
      gesture_class = gesture_type.first
      # To unreliable
      #`afplay sword.wav` if gesture_class == Artoo::Drivers::Leapmotion::Gesture::Swipe
      `afplay click.wav` if gesture_class == Artoo::Drivers::Leapmotion::Gesture::KeyTap
      `afplay blop.wav`  if gesture_class == Artoo::Drivers::Leapmotion::Gesture::ScreenTap
    end
  end
end

def on_close(*args)
  puts args
end

def display_hand(height, color, token = '#')
  puts ("#{color}#{token}#{reset}" * as_percentage(height)) + height.to_s
end

def as_percentage(number)
  @max_height ||= 565
  @cols ||= `tput cols`.chomp.to_i
  val = (((number.to_i) * (@cols) / (@max_height)))

  val = 1 if val < 1
  val = @cols if val > @cols

  val
end

def get_color(code)
  case code
  when 0 then "\033[31m" #red
  when 1 then "\033[32m" #green
  when 3 then "\033[33m" #yellow
  when 4 then "\033[34m" #cyan
  when 5 then "\033[36m"
  else
    "\033[35m" #magenta
  end
end

def reset
  "\033[m"
end
