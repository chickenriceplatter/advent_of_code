require 'pry'

duration = 2503

string = File.read("14-1-input.txt")

array = string.strip.split("\n")

hash = {}

array.each do |line|
  a = line.split(" ")
  name = a.first
  speed = a[3].to_i
  time = a[6].to_i
  rest = a[-2].to_i

  hash[name] = {speed: speed, time: time, rest: rest}
end

state = {}

hash.each do |k,v|
  a = ["m"] * v[:time] + ["r"] * v[:rest]

  cycles = duration / (v[:time] + v[:rest]) + 1

  final = a * cycles

  state[k] = final[0...duration]
end

positions = {}

hash.each do |k,v|
  position = []

  reindeer_state = state[k]
  reindeer_speed = v[:speed]

  location = 0

  reindeer_state.each do |event|
    if event == "m"
      location  += reindeer_speed
    end

    position << location
  end

  positions[k] = position
end

points = {}

hash.each do |k,_|
  points[k] = 0
end

(0...2503).each do |second|
  max_position = 0

  positions.each do |_,v|
    if v[second] > max_position
      max_position = v[second]
    end
  end

  positions.each do |k,v|
    if v[second] == max_position
      points[k] += 1
    end
  end
end




binding.pry
