#!/usr/bin/ruby
# Note for this exercise, follow these simplified pig latin rules
# If the first letter is a vowel, add "way" to the end
# If the first letter is a consonant, move it to the end and add "ay"
# Hint: Use regex
#
# apple => appleway
# hello => ellohay

def pigatize(text)
  if starts_with_vowel?(text)
    text + "way"
  else
    char = text[0]
    text[1..-1] + char + "ay"
  end
end

def starts_with_vowel?(text)
  %w(a e i o u).include?(text[0])
end

loop do
  puts "Please enter a word and I will translate to pig latin"
  text = gets.chomp.downcase
  break if text.length == 0 # Break out of the loop if I say nothing
  puts pigatize(text)
end
