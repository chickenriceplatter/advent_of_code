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



longest = 0
reindeer = ""

hash.each do |k,v|
  cycle_length = v[:time] + v[:rest]

  complete_cycles = duration / cycle_length

  remainder_time = duration % cycle_length

  distance = complete_cycles * v[:speed] * v[:time]

  if remainder_time >= v[:time]
    distance += v[:speed] * v[:time]
  else
    distance += v[:speed] * remainder_time
  end

  if distance > longest
    longest = distance
    reindeer = k
  end
end

puts reindeer
puts longest


binding.pry
