require 'pry'

input = File.read("6-input.txt")

array = input.strip.split("\n")

hash = {}

array.each do |string|

  string.chars.each_with_index do |letter, index|
    unless hash.has_key?(index)
      hash[index] = {}
    end

    unless hash[index].has_key?(letter)
      hash[index][letter] = 1
    else
      hash[index][letter] += 1
    end
  end
end

message = ""

hash.each do |_,v|
  sorted = v.sort_by{ |_,v| v}
  letter = sorted.first.first

  message << letter
end

puts message






