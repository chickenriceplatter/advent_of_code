require 'pry'

input = File.read("4-input.txt")

array_of_strings = input.split("\n")

total = 0

def letter_count(string)
  string = string.downcase.gsub("-","")

  hash = {}

  string.chars.each do |letter|
    if hash.has_key?(letter)
      hash[letter] += 1
    else
      hash[letter] = 1
    end
  end
  hash
end

def calculated_checksum(string)
  string = encrypted_name(string)
  hash = letter_count(string)
  values = hash.values.uniq.sort.reverse

  output = ""

  values.each do |value|
    keys = hash.select{ |_,v| v == value }.keys.sort.join("")
    output << keys
  end
  output[0..4]
end

def checksum(string)
  suffix = string.strip.split("-").last
  suffix.split("[").last.gsub("]","")
end

def encrypted_name(string)
  string.strip.split("-")[0..-2].join("")
end


def real_room?(string)
 calculated_checksum(string).split("").sort == checksum(string).split("").sort
end

def sector_id(string)
  suffix = string.strip.split("-").last
  suffix.split("[").first.to_i
end

real_rooms = 0


array_of_strings.each do |string|
  if real_room?(string)
    total += sector_id(string)
    real_rooms += 1
  end
end

puts total
puts real_rooms
