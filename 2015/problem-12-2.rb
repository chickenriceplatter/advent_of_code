require 'pry'
require 'json'

string = File.read("12-1-input.txt")

array = JSON.parse(string)

stack = []

total = 0

array.each do |object|
  stack << object
end

while !stack.empty?
  item = stack.pop

  if item.class == Array
    item.each do |element|
      if((element.class == Array) || (element.class == Hash))
        stack << element
      end

      if element.class == Fixnum
        total += element
      end
    end
  end

  if item.class == Hash
    next if item.values.include?("red")
    item.values.each do |value|
      if((value.class == Array) || (value.class == Hash))
        stack << value
      elsif value.class == Fixnum
        total += value
      else
      end
    end
  end

  if item.class == Fixnum
    total += item
  end
end

puts total

binding.pry
