require 'pry'
require 'digest'

md5 = Digest::MD5.new

input = "cxdnnyjw"

password = [nil] * 8

index = 0

filter = ["8","9","a","b","c","d","e","f"]

loop do

  string = input + index.to_s

  hash = md5.hexdigest(string)

  if hash[0...5] == "00000" && !filter.include?(hash[5])
    position = hash[5].to_i
    value = hash[6]

    if password[position].nil?
      puts "position: #{position} value: #{value}"
      password[position] = value
      puts "password: #{password}"
      puts password.size
    end

    if !password.include?(nil)
      puts password.join("")
      break
    end
  end

  index += 1

end


# binding.pry


