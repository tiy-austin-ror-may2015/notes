
# Ask for user's age
# Tell user what they can do with their age.
# If I am less than 18 I can do nothing.
# If I am older than 18 I can vote (and smoke).
# If I am older than 21 I can drink.
# If I am older than 25 I can rent a car.

def gets_with_prompt(prompt)
  print prompt
  gets.chomp
end

def welcome
  puts "Ruby Age Verifier v0.0.1"
end

def verify_age
  age = gets_with_prompt("What is your age (in years)? > ").to_i
  loop do
    response = gets_with_prompt("Do you want to change your age? > ")
    if response == 'y'
      age = gets_with_prompt("What is your age (in years)? > ").to_i
    else
      break
    end
  end
  return age
end

def print_permissions(age)
  loop do
    if age < 18
      puts "There is nothing for you to do. Go back to school."
    else
      puts "You are welcome to vote and smoke to your hearts content. However, go to college."
    end

    if age >= 21
      puts "Do you want a drink, because thats is legal for you now."
    end

    if age >= 25
      puts "You are finally free. Go rent a car. Cochella awaits, you hipster."
    end

    response = gets_with_prompt("Do you want to try another age? > ")
    if response == 'y'
      age = gets_with_prompt("What is your age (in years)? > ").to_i
    else
      break
    end
  end
end


welcome
age = verify_age
print_permissions(age)









