require 'pry'

string = File.read("24-1-input.txt")

array = string.strip.split("\n")

array.map!{ |each| each.to_i }

bundles = {}

lowest_qe = 10**100
combinations = []

# 6,8

array.combination(6).each do |combination|
  total = combination.reduce(:+)

  if total == 516
    product = combination.reduce(:*)

    if product <= lowest_qe
      lowest_qe = product
      combinations << combination
    end
  end
end

puts lowest_qe

binding.pry

