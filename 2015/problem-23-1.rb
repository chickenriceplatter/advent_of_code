require 'pry'

string = File.read("23-1-input.txt")

array = string.strip.split("\n")

array_size = array.size

position = 0

a = 0
b = 0

loop do

  puts "position: #{position}, a: #{a}"

  instruction = array[position]

  if instruction.include?("inc")
    if instruction.include?("a")
      a += 1
    else
      b += 1
    end
    position += 1
  elsif instruction.include?("tpl")
    if instruction.include?("a")
      a = a * 3
    else
      b = b * 3
    end
    position += 1
  elsif instruction.include?("hlf")
    if instruction.include?("a")
      a = a / 2
    else
      b = b / 2
    end
    position += 1
  elsif instruction.include?("jmp")
    steps = instruction.split(" ").last.to_i
    position = position + steps
  elsif instruction.include?("jie")
    if instruction.include?("a")
      variable = a
    else
      variable = b
    end
    if variable % 2 == 0
      steps = instruction.split(" ").last.to_i
      position = position + steps
    else
      position += 1
    end
  elsif instruction.include?("jio")
    if instruction.include?("a")
      variable = a
    else
      variable = b
    end

    if variable == 1
      steps = instruction.split(" ").last.to_i
      position = position + steps
    else
      position += 1
    end
  else
  end

  if position >= array_size
    break
  end

end

puts a

binding.pry
