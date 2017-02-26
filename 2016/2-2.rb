require 'pry'

#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D

move = {
  "1" => {
    u:"1",
    d:"3",
    l:"1",
    r:"1"
  },
  "2" => {
    u:"2",
    d:"6",
    l:"2",
    r:"3"
  },
  "3" => {
    u:"1",
    d:"7",
    l:"2",
    r:"4"
  },
  "4" => {
    u:"4",
    d:"8",
    l:"3",
    r:"4"
  },
  "5" => {
    u:"5",
    d:"5",
    l:"5",
    r:"6",
  },
  "6" => {
    u:"2",
    d:"A",
    l:"5",
    r:"7"
  },
  "7" => {
    u:"3",
    d:"B",
    l:"6",
    r:"8"
  },
  "8" => {
    u:"4",
    d:"C",
    l:"7",
    r:"9",
  },
  "9" => {
    u:"9",
    d:"9",
    l:"8",
    r:"9"
  },
  "A" => {
    u:"6",
    d:"A",
    l:"A",
    r:"B"
  },
  "B" => {
    u:"7",
    d:"D",
    l:"A",
    r:"C"
  },
  "C" => {
    u:"8",
    d:"C",
    l:"B",
    r:"C"
  },
  "D" => {
    u:"B",
    d:"D",
    l:"D",
    r:"D"
  }
}

current = "5"

solution = ""

input = File.read("2-input.txt")
array_of_strings = input.strip.split("\n")
array_of_arrays = array_of_strings.map{ |each| each.split("") }

array_of_arrays.each do |array|
  array.each do |step|
    step = step.downcase.to_sym
    current = move[current][step]
  end
  solution << current
end

puts solution


































