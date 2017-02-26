require 'pry'

string = File.read("15-1-input.txt")

array = string.strip.split("\n")

array.map!{ |each| each.split(" ") }

attributes = []

array.each do |line|
  temp = []
  temp << line[2].to_i
  temp << line[4].to_i
  temp << line[6].to_i
  temp << line[8].to_i

  attributes << temp
end

# [1,1,1,1]

# [[5, -1, 0, 0], [-1, 3, 0, 0], [0, -1, 4, 0], [-1, 0, 0, 2]]



def score_proportion(attributes, proportion)

  count = 0

  aoa = [[],[],[],[]]

  attributes.each_with_index do |line,index|
    multiplier = proportion[index]
    (0..3).each do |i|
      product = line[i] * multiplier
      count += 1
      aoa[i] << product
    end
  end

  aoa.map!{ |each| each.reduce(:+) }

  aoa.each do |number|
    return 0 if number <= 0
  end

  aoa.reduce(:*)
end

highest = 0
recipe = 0

(0..97).each do |first|
  puts first
  (0..97).each do |second|
    next if((first+second) > 98)
    (0..97).each do |third|
      next if((first+second+third) > 99)
      (0..97).each do |fourth|
        total = first + second + third + fourth

        if total == 100
          array = [first, second, third, fourth]

          score = score_proportion(attributes, array)

          if score > highest
            highest = score
            recipe = array
          end
        end

      end
    end
  end
end

puts highest
p recipe

binding.pry
