require 'pry'

string = File.read("17-1-input.txt")

array = string.strip.split("\n")

array.map!{ |each| each.to_i }

hash = {}

(1..20).each do |number|
  combinations = array.combination(number)
  hash[number] = 0

  combinations.each do |combination|
    if combination.reduce(:+) == 150
      hash[number] += 1
    end
  end
end

p hash

binding.pry
