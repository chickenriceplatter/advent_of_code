require 'pry'

def next_sequence(string)
  array = string.split(//)

  string_with_commas = ""

  array.each_with_index do |letter, index|
    if index == 0
      string_with_commas << letter
      next
    end

    if letter == string_with_commas[-1]
      string_with_commas << letter
    else
      string_with_commas << ","
      string_with_commas << letter
    end
  end

  broken_up = string_with_commas.split(",")

  output = ""

  broken_up.each do |item|
    output << item.size.to_s
    output << item[0]
  end

  output
end

string = '3113322113'

50.times do
  temp = next_sequence(string)
  string = temp
end

puts string.size


