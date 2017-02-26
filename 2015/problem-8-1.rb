require 'pry'

string = File.read("8-1-input.txt")

array = string.split("\n")

long_size = 0

short_size = 0

# def memory_string(string)
#   string = string.gsub(/\\x../, "|").gsub("\\\\", "|").gsub('\"', "|")
# end

def long_count(string)
  eval(string.inspect).size
end

def short_count(string)
  eval(string).size
end

# array = ['""', '"abc"', '"aaa\"aaa"', '"\x27"']

array.each do |string|
  string = string.strip
  long_size += long_count(string)
  short_size += short_count(string)
end

puts long_size - short_size

binding.pry
