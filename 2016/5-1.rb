require 'pry'
require 'digest'

md5 = Digest::MD5.new

input = "cxdnnyjw"

password = ""

index = 0

loop do

  string = input + index.to_s

  hash = md5.hexdigest(string)

  if hash[0...5] == "00000"
    puts "hash: #{hash}, letter: #{hash[5]}"
    password << hash[5]
    puts "password: #{password}"
    if password.size == 8
      break
    end
  end

  index += 1

end


# binding.pry


