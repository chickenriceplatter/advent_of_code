require 'pry'
require 'json'

string = File.read("12-1-input.txt")

new_string = ""

needed = "-1234567890,"

string.chars.each do |char|
  new_string << char if needed.include?(char)
end

array = new_string.split(",")

array = array.map{ |each| each.to_i }

puts array.reduce(:+)

