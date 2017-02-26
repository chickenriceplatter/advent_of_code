require 'pry'

input = File.read("1-1-input.txt")

# input = File.read("sample.txt")

array = input.split(",")

facing = "n"

def change_direction(facing, turn)
  facing = facing.downcase
  turn = turn.downcase

  if facing == "n"
    if turn == "r"
      return "e"
    else
      return "w"
    end
  elsif facing == "e"
    if turn == "r"
      return "s"
    else
      return "n"
    end
  elsif facing == "s"
    if turn == "r"
      return "w"
    else
      return "e"
    end
  else
    if turn == "r"
      return "n"
    else
      return "s"
    end
  end
end

horizontal = 0
vertical = 0

array.each do |step|
  step = step.strip
  turn = step[0]
  blocks = step[1..-1].to_i

  facing = change_direction(facing, turn)

  puts "#{facing}, #{blocks}"

  if facing == "n"
    vertical += blocks
  elsif facing == "s"
    vertical -= blocks
  elsif facing == "e"
    horizontal += blocks
  else
    horizontal -= blocks
  end
end

puts "#{horizontal} + #{vertical} = #{horizontal.abs + vertical.abs}"

