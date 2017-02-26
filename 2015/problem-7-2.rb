require 'pry'

string = File.read('7-2-input.txt')
array = string.strip.split("\n")

hash = {}

array.each do |item|
  list = item.split(" -> ")
  hash[list.last] = list.first
end

def to_i?(string)
  Integer(string) rescue false
end

solutions = {}

hash.each do |k,v|
  if to_i?(v)
    solutions[k] = v.to_i
  end
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

def solved_key?(key, hash)
  hash.keys.include?(key)
end

def solvable?(string, solutions)
  array = string.split(" ")

  if array.size == 1
    if solved_key?(array.first, solutions)
      return true
    else
      return false
    end
  end

  if array.size == 2
    if solutions.keys.include?(array.last) || to_i?(array.last)
      return true
    else
      return false
    end
  end

  if array.size == 3
    if solutions.keys.include?(array.first) || to_i?(array.first)
      if solutions.keys.include?(array.last) || to_i?(array.last)
        return true
      else
        return false
      end
    else
      return false
    end
  end
end

def solve(string, solutions)
  array = string.split(" ")

  if array.size == 1
    return solutions[array.first]
  end


  if array.size == 2
    key = array.last
    number = 0

    if to_i?(key)
      number = key
    else
      number = solutions[key]
    end

    return binary_not(number)
  end

  if array.size == 3
    operator = array[1]
    if to_i?(array.first)
      first = to_i?(array.first)
    else
      first = solutions[array.first].to_i
    end

    if to_i?(array.last)
      second = to_i?(array.last)
    else
      second = solutions[array.last].to_i
    end

    if operator == "AND"
      return binary_and(first, second)
    elsif operator == "OR"
      return binary_or(first, second)
    elsif operator == "LSHIFT"
      return left_shift(first, second)
    elsif operator == "RSHIFT"
      return right_shift(first, second)
    else
      return "error"
    end
  end
end

p solutions

while solutions.size < 339 do
  hash.each do |k,v|
    next if solutions.keys.include?(k)

    if solvable?(v, solutions)
      solutions[k] = solve(v, solutions)
    end
  end
  p solutions
end

binding.pry
