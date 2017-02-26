require 'pry'

string = File.read("17-1-input.txt")

array = string.strip.split("\n")

array.map!{ |each| each.to_i }

count = 0

(4..20).each do |number|
  combinations = array.combination(number)

  combinations.each do |combination|
    if combination.reduce(:+) == 150
      count += 1
    end
  end
end

puts count

binding.pry
