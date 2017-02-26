require 'pry'

input = File.read("3-input.txt")

array_of_strings = input.split("\n")

array_of_arrays = array_of_strings.map{ |each| each.strip.split(" ").map{ |s| s.to_i }}

count = 0

triplets = []

array_of_arrays.each_slice(3).each do |triplet|
  first = [triplet.first[0],triplet[1][0],triplet[2][0]]
  second = [triplet.first[1],triplet[1][1],triplet[2][1]]
  third = [triplet.first[-1],triplet[1][-1],triplet.last[-1]]
  triplets << first
  triplets << second
  triplets << third
end

triplets.each do |array|
  array = array.sort

  sum = array.first + array[1]

  if sum > array.last
    count += 1
  end
end

puts count
