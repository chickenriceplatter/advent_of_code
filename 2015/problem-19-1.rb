require 'pry'

string = File.read("19-1-input.txt")

array = string.split("\n\n")

replacements = array.first.strip.split("\n")

molecule = array.last.strip

replacements.map!{ |each| each.split(" => ") }

def find_indices(string, substring)

  array = []

  substring_size = substring.size

  string_size = string.size

  (0...string_size).each do |index|
    if(string[index...(index+substring_size)] == substring)
      array << index
    end
  end
  array
end

uniques = []

def replace_substring(string, index, replacement)
  clone = string.clone
  replacement_size = replacement.size
  clone[index...(index+replacement_size)] = replacement
  clone
end



replacements.each do |replacement|
  p replacement
  indices = find_indices(molecule, replacement.first)

  substitute = replacement.last
  original_size = replacement.first.size
  indices.each do |index|
    clone = molecule.clone
    clone[index...(index+original_size)] = substitute

    uniques << clone unless uniques.include?(clone)
  end
end

puts uniques.size

binding.pry
