require 'pry'

input = File.read("7-input.txt")

array = input.strip.split("\n")

def contains_abba(string)
  string_size = string.size
  return false if string_size < 4

  (0..string_size-4).each do |index|
    substring = string[index...index+4]
    if substring == substring.reverse
      if substring.split("").uniq.size > 1
        return true
      end
    end
  end
  false
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

def supports_tls(string)
  interior = interior_strings(string)
  exterior = exterior_strings(string)

  interior = interior.map{ |each| contains_abba(each) }
  exterior = exterior.map{ |each| contains_abba(each) }

  interior_flag = interior.reduce(&:|)
  exterior_flag = exterior.reduce(&:|)

  !interior_flag & exterior_flag
end

# abba[mnop]qrst supports TLS (abba outside square brackets).
# abcd[bddb]xyyx does not support TLS (bddb is within square brackets, even though xyyx is outside square brackets).
# aaaa[qwer]tyui does not support TLS (aaaa is invalid; the interior characters must be different).
# ioxxoj[asdfgh]zxcvbn supports TLS (oxxo is outside square brackets, even though it's within a larger string).

a = "abba[mnop]qrst"
b = "abcd[bddb]xyyx"
c = "aaaa[qwer]tyui"
d = "ioxxoj[asdfgh]zxcvbn"

puts supports_tls(a)
puts supports_tls(b)
puts supports_tls(c)
puts supports_tls(d)

count = 0

array.each do |string|
  count += 1 if supports_tls(string)
end

puts count


