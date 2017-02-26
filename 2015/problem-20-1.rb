require 'pry'

def find_factors(number)
  square_root = (number**(0.5)).to_i + 1

  factors = []

  (1..square_root).each do |factor|
    if number % factor == 0
      factors << factor
      factors << number / factor
    end
  end
  factors.uniq.sort
end

number = 2

loop do

  if number % 100000 == 0
    puts number
  end

  factors = find_factors(number)

  total = factors.reduce(&:+)

  if total >= 2900000
    puts number
    break
  end

  number += 2
end

binding.pry


