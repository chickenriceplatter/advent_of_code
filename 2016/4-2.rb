require 'pry'

input = File.read("4-input.txt")

def encrypted_name(string)
  string.strip.split("-")[0..-2].join("-")
end

def sector_id(string)
  suffix = string.strip.split("-").last
  suffix.split("[").first.to_i
end

def decrypt(string, shift)
  diff = shift % 26

  output = ""

  string.chars.each do |char|
    if char == "-"
      output << " "
    else
      new_position = char.ord + diff
      new_position -= 26 if new_position > 122
      output << new_position.chr
    end
  end
  output
end

array = input.split("\n")

array.each do |string|
  id = sector_id(string)
  deciphered = decrypt(encrypted_name(string),sector_id(string))
  puts "#{deciphered} sector id: #{id}" if deciphered.include?("north")
end
