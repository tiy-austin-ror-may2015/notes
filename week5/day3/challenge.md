## Morning Challenge

- Write out the fizzbuzz problem on paper using pen or pencil without using your computer.
```
def fizzbuzz
  (1..100).each do |n|
    if (n % 5).zero? && (n % 3).zero?
      puts 'fizzbuzz'
    elsif n % 5 == 0
      puts 'buzz'
    elsif n % 3 == 0
      puts 'fizz'
    else
      puts n
    end
  end
end
```

- If you finish that and have time remaining, write out the answers to these questions:

- Where is routes.rb located in a rails project? **config**

- Where is database.yml located in a rails project? **config**

- Where do you put your models? **app/models**

- Can you call render multiple times in a controller action? **1x**
