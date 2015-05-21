class Fizzbuzz
  def run(max = 100)
    (1..max).map do |num|
      if num % 15 == 0
        div_fifteen(num)
      elsif num % 5 == 0
        div_five(num)
      elsif num % 3 == 0
        div_three(num)
      else
        num
      end
    end
  end

  def div_three(num)
    div_by_num(num, 3, 'fizz')
  end

  def div_five(num)
    div_by_num(num, 5, 'buzz')
  end

  def div_fifteen(num)
    div_by_num(num, 15, 'fizzbuzz')
  end

  def div_by_num(num, divisor, return_str)
    if (num % divisor).zero?
      return_str
    else
      num
    end
  end






end
