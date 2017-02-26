require 'pry'

string = File.read("13-1-input.txt")

array = string.strip.split("\n")

lists = array.map{ |each| each.split(" ") }

people = lists.map{ |each| each.last.gsub(".", "") }.uniq .sort

happiness = {}

lists.each do |line|
  first = line.first
  second = line.last.gsub(".", "")
  points = line[3].to_i

  if line[2] == "lose"
    points = -1 * points
  end

  key = [first,second].sort

  if happiness.has_key?(key)
    happiness[key] += points
  else
    happiness[key] = points
  end
end

people << "me"

highest = 0

def score_arrangement(array, happiness)
  total = 0

  (0...array.size).each do |index|
    first = array[index]
    second = ""
    if index == array.size - 1
      second = array[0]
    else
      second = array[index+1]
    end

    unless(first == "me" || second == "me")
      key = [first,second].sort
      total += happiness[key]
    end
  end
  total
end

people.permutation.each do |perm|
  temp = score_arrangement(perm, happiness)
  highest = temp if temp > highest
end

puts highest

binding.pry
