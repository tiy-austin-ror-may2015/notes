require 'securerandom'
RED   = "\033[31m"
CLEAR = "\033[m"
ALL_CHARS = [*('A'..'Z'),*('a'..'z'), ' ', ',' '.', '']
STUDENTS  = DATA.each_line.map { |student_name| student_name.chomp }

def random_line(width)
  Array(ALL_CHARS).sample(width).join
end

def student_line(letters, length, padding)
  chars = random_line(length).split(//)
  letters.each_with_index { |c, i| chars[padding + i] = RED + c + CLEAR }
  chars.join
end

chosen_student = STUDENTS[SecureRandom.random_number(STUDENTS.length)]
letters   = []
width     = ALL_CHARS.length + chosen_student.length

(chosen_student.length + 1).times do |n|
  ALL_CHARS.shuffle.each do |char|
    system('clear')

    padding = (((width / 2) - letters.length))
    len = width - letters.length

    2.times do
      puts random_line(width)
    end

    puts student_line(letters, len, padding)

    2.times do
      puts random_line(width)
    end

    sleep 0.005
    if char == chosen_student[n]
      letters << char
      break
    end
  end
end

__END__
Cecy Correa
Tiffany Lewis
John Daugherty
Matthew Giardina
Reid Paape
Benjamin Hand
Mike Pitre
Alejandro Reyes
Will Sherman
Wei Xia
