require 'pry'

string = File.read("9-1-input.txt")

array = string.strip.split("\n")

array = array.map{ |each| each.split(" ") }

places = []

distances = {}

array.each do |list|
  places << list.first
  places << list[2]

  temp = []
  temp << list.first
  temp << list[2]

  distances[temp.sort] = list.last.to_i
end

places = places.uniq.sort

shortest = 10000000

places.permutation.each do |perm|
  array_size = perm.size

  total = 0
  (0..(array_size -2)).each do |index|
    key = perm[index..index+1].sort
    total += distances[key]
  end

  shortest = total if total < shortest
end

puts shortest
