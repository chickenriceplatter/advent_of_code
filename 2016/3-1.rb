require 'pry'

input = File.read("3-input.txt")

array_of_strings = input.split("\n")

array_of_arrays = array_of_strings.map{ |each| each.strip.split(" ").map{ |s| s.to_i }}

count = 0

array_of_arrays.each do |array|
  array = array.sort

  sum = array.first + array[1]

  if sum > array.last
    count += 1
  end
end

binding.pry

puts count
