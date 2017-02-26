require 'pry'

input = File.read("1-1-input.txt")

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

def move(current_location, facing)
  if facing == "n"
    current_location[1] = current_location[1] + 1
  elsif facing == "s"
    current_location[1] = current_location[1] - 1
  elsif facing == "e"
    current_location[0] = current_location[0] + 1
  else
    current_location[0] = current_location[0] - 1
  end
end

current_location = [0,0]

visited = [[0,0]]

array.each do |step|
  step = step.strip
  turn = step[0]
  blocks = step[1..-1].to_i

  facing = change_direction(facing, turn)

  blocks.times do
    move(current_location, facing)

    if visited.include?(current_location)
      puts "#{current_location}"
    else
      visited << current_location.clone
    end
  end
end
