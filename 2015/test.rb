require 'pry'

string = File.read("7-1-input.txt")

array = string.split("\n")

sorted = array.sort_by{ |each| each.size }

hash = {}

def to_i?(string)
  Integer(string) rescue false
end

sorted.each do |string|
  t = string.split(" -> ")
  hash[t.last] = t.first
end

solutions = {}

hash.each do |k,v|
  if to_i?(v)
    solutions[k] = to_i?(v)
  end
end

def solved_key?(key, hash)
  hash.keys.include?(key)
end

def binary_not(number)
  2**16 - 1 - number
end

def binary_and(one, two)
  one & two
end

def binary_or(one, two)
  one | two
end

def left_shift(number, places)
  number << places
end

def right_shift(number, places)
  number >> places
end




while solutions.size < 339

  hash.each do |k,v|
    next if solved_key?(k)

    clues = v.split(" ")

    if clues.size == 1
      if solved_key?(clues.first)
        solutions[k] = v
      end
    end

    if clues.size == 2
      if solved_key?(clues.last)
        number = clues.last
        solutions[k] = binary_not(number)
    end

    if clues.size == 3
      operands << clues.first
      operands << clues.last
    end



end

binding.pry
