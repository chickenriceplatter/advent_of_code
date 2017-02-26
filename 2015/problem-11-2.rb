require 'pry'

def iol?(string)
  if(string.include?("i") || string.include?("o") || string.include?("l"))
    return true
  else
    return false
  end
end

def double_pairs?(string)
  occurrences = []
  (0...(string.size-1)).each do |index|
    occurrences << [index, index+1] if string[index] == string[index+1]
  end
  return false if occurrences.size < 2
  return true if occurrences.size > 2
  return false if occurrences.first.last == occurrences.last.first
  true
end

def three_consecutive?(string)
  (0...(string.size-2)).each do |index|
    first = string[index]
    return true if((string[index+1] == first.next)&&(string[index+2] == first.next.next))
  end
  return false
end

password = "hxbxxyzz"

count = 0

loop do
  temp = password.next
  password = temp
  count = count + 1

  next if iol?(temp)

  if(double_pairs?(temp) && three_consecutive?(temp))
    puts temp
    break
  end
end
