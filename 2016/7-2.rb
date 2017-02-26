require 'pry'

input = File.read("7-input.txt")

array = input.strip.split("\n")

def triplets(string)
  string_size = string.size
  return false if string_size < 3

  array = []

  (0..string_size-3).each do |index|
    if string[index] == string[index+2] && string[index] != string[index + 1]
      array << string[index..index+2]
    end
  end
  array
end

def bracket_indices(string)
  indices = []
  filter = ["[","]"]

  string.chars.each_with_index do |char, index|
    indices << index if filter.include?(char)
  end
  indices
end

def interior_strings(string)
  indices = bracket_indices(string)

  strings = []

  indices.each_slice(2) do |slice|
    strings << string[slice.first+1...slice.last]
  end
  strings
end

def exterior_strings(string)
  clone = string.clone
  while clone.index("[") != nil
    left_index = clone.index("[")
    clone = clone.insert(left_index, ",")
    right_index = clone.index("]")
    clone.slice!(left_index+1..right_index)
  end
  clone.split(",")
end

def interior_triplets(string)
  array = []
  interior_strings(string).each do |s|
    array.concat(triplets(s))
  end
  array
end

def exterior_triplets(string)
  array = []
  exterior_strings(string).each do |s|
    array.concat(triplets(s))
  end
  array
end

def invert_triplets(array)
  out = []
  array.each do |item|
    s = item[1] + item[0] + item[1]
    out << s
  end
  out
end


def supports_ssl(string)
  combined = exterior_triplets(string) & invert_triplets(interior_triplets(string))
  !combined.empty?
end

a = "aba[bab]xyz"
b = "xyx[xyx]xyx"
c = "aaa[kek]eke"
d = "zazbz[bzb]cdb"

puts supports_ssl(a)
puts supports_ssl(b)
puts supports_ssl(c)
puts supports_ssl(d)

count = 0

array.each do |string|
  count += 1 if supports_ssl(string)
end

puts count


