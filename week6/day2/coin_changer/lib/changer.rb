def changer(amount)
  returned_coins = []
  [25, 10, 5, 1].each do |denomination|
    coins = amount / denomination
    returned_coins += ([denomination] * coins)
    amount -= coins * denomination
  end
  returned_coins
end
