require 'pry'

string = File.read("16-1-input.txt")

array = string.strip.split("\n")


clues = {
children: 3,
cats: 7,
samoyeds: 2,
pomeranians: 3,
akitas: 0,
vizslas: 0,
goldfish: 5,
trees: 3,
cars: 2,
perfumes: 1,
}

hash = {}

array.each do |line|
  index = line.index(":")
  line.insert(index+1, ",")
  line = line.gsub(" ", "")

  temp = line.split(",")

  name = temp.first[0..-2]
  second = temp[1].split(":")
  third = temp[2].split(":")
  fourth = temp[3].split(":")

  d = {}
  d[second.first.to_sym] = second.last.to_i
  d[third.first.to_sym] = third.last.to_i
  d[fourth.first.to_sym] = fourth.last.to_i

  hash[name] = d
end

hash.each do |key,values|
  name = key

  flags = []

  values.each do |k,v|
    bool = (clues[k] == v)
    flags << bool
  end

  if flags.count(true) == 3
    puts name
    break
  end
end


binding.pry
