# Coin Changer Kata Challenge
Write a ruby method that will take an amount less than 100 and return the amount of coins needed to make up that amount. The method should always return the smallest amount of coins needed.


## Usage Examples
```
 changer(99) #=> [25, 25, 25, 10, 10, 1, 1, 1, 1]
 changer(75) #=> [25, 25, 25] 
 changer(14) #=> [10, 1, 1, 1, 1]
 changer(5)  #=> [5]
```

## Normal Mode
Complete the coin changer _method_ so that it works with all the above examples


## Hard / Nightmare Mode
Use **TDD** with `MiniTest` to complete the Coin Changer kata.


## Starter Template
```
QUARTER = 25
DIME    = 10
NICKLE  = 5
PENNY   = 1
COINS   = [QUARTER, DIME, NICKLE, PENNY]
def changer(amount)

end
```