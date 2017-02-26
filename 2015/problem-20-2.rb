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

number = 500000

# def remove_small_factors(factors, number)
#   factors.each do |factor|
#     if factor * 50 < number
#       factors.delete(factor)
#     end
#   end
#   factors
# end

loop do

  if number % 100000 == 0
    puts number
  end

  factors = find_factors(number)

  copy = factors.clone

  factors.each do |factor|
    if factor * 50 < number
      copy.delete(factor)
    end
  end

  total = copy.reduce(&:+)

  if total >= 2636364
    puts number
    break
  end

  number += 2
end

binding.pry


