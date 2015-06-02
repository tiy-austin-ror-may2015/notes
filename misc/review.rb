require 'securerandom'

STUDENTS = [
  'Cecy Correa',
  'Tiffany Lewis',
  'John Daugherty',

  'Matthew Giardina',
  'Reid Paape',
  'Benjamin Hand',

  'Mike Pitre',
  'Alejandro Reyes',
  'Will Sherman',
  'Wei Xia',
]

chosen_student = STUDENTS[SecureRandom.random_number(STUDENTS.length + 1)]

#letters = []
#chosen_student.length.times do |n|
#  STUDENTS.shuffle.each do |student|
#    system('clear')
#    print letters.join('') + student[n].to_s
#    sleep 0.05
#    if student == chosen_student
#      letters << student[n]
#      break
#    end
#  end
#end

def ran_chr(count = `tput cols`.chomp.to_i)
  Array('a'..'z').sample(count).join
end
letters   = []
all_chars = [*('A'..'Z'),*('a'..'z'), ' ', ',' '.', '']
width     = all_chars.length
width    += 1 if chosen_student.length.odd?

chosen_student.length.times do |n|
  all_chars.shuffle.each do |char|
    padding = (((width / 2) - chosen_student.length / 2 - letters.length / 2)) / 2
    system('clear')
    print Array('a'..'z').sample(width).join
    puts
    print Array('a'..'z').sample(width).join
    puts
    print ran_chr(padding), "\033[31m" + letters.join + char + "\033[m", ran_chr(padding)
    puts
    print Array('a'..'z').sample(width).join
    puts
    print Array('a'..'z').sample(width).join
    puts
    sleep 0.005
    if char == chosen_student[n]
      letters << char
      break
    end
  end
end
