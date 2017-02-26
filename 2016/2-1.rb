require 'pry'

# 1 2 3
# 4 5 6
# 7 8 9

input = File.read("2-input.txt")

array_of_strings = input.strip.split("\n")

array_of_arrays = array_of_strings.map{ |each| each.split("")}

current = "5"

solution = ""

move = {
  "1" => {
    "u":"1",
    "d":"4",
    "l":"1",
    "r":"2"
  },
  "2" => {
    "u":"2",
    "d":"5",
    "l":"1",
    "r":"3"
  },
  "3" => {
    "u":"3",
    "d":"6",
    "l":"2",
    "r":"3"
  },
  "4" => {
    "u":"1",
    "d":"7",
    "l":"4",
    "r":"5"
  },
  "5" => {
    "u":"2",
    "d":"8",
    "l":"4",
    "r":"6"
  },
  "6" => {
    "u":"3",
    "d":"9",
    "l":"5",
    "r":"6"
  },
  "7" => {
    "u":"4",
    "d":"7",
    "l":"7",
    "r":"8"
  },
  "8" => {
    "u":"5",
    "d":"8",
    "l":"7",
    "r":"9"
  },
  "9" => {
    "u":"6",
    "d":"9",
    "l":"8",
    "r":"9"
  }
}

array_of_arrays.each do |array|
  array.each do |step|
    step = step.downcase.to_sym
    current = move[current][step]
    puts "number: #{current} direction: #{step}"
  end
  solution << current
end

puts solution











