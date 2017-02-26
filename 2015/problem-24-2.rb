require 'pry'

string = File.read("24-1-input.txt")

array = string.strip.split("\n")

array.map!{ |each| each.to_i }

# bundles = {}

# combo_size = 0

# (2..8).each do |number|
#   bundles[number] = []
#   array.combination(number).each do |combo|
#     total = combo.reduce(:+)

#     if total == 387
#       bundles[number] << combo
#     end
#   end
# end




# (2..9).each do |number|
#   array.combination(number).each do |combination|
#     total = combination.reduce(:+)

#     if total == 387
#       combo_size = number
#       break
#     end
#   end
# end

lowest_qe = 10**100
combinations = []

array.combination(5).each do |combination|
  total = combination.reduce(:+)

  if total == 387
    product = combination.reduce(:*)

    if product <= lowest_qe
      lowest_qe = product
      combinations << combination
    end
  end
end

puts lowest_qe

binding.pry

