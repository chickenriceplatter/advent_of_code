require 'pry'

string = File.read("18-1-input.txt")

def neighbors(x,y)
  locations = []

  locations << [x+1, y] if((x+1) < 100)
  locations << [x-1, y] if((x-1) >= 0)
  locations << [x, y+1] if((y+1) < 100)
  locations << [x, y-1] if((y-1) >= 0)
  locations << [x-1, y-1] if(((x-1)>=0)&&((y-1)>=0))
  locations << [x+1, y+1] if(((x+1)<100)&&((y+1)<100))
  locations << [x-1, y+1] if(((x-1)>=0)&&((y+1)<100))
  locations << [x+1, y-1] if(((x+1)<100)&&((y-1)>=0))
  locations
end

def transform_string(input_string)
  array = input_string.strip.split("\n")

  array.map!{ |row| row.split("") }

  new_string = ""

  (0..99).each do |y|
    (0..99).each do |x|
      current_light = array[y][x]

      neighbor_locations = neighbors(x,y)

      neiboring_lights = neighbor_locations.map{ |each| array[each.last][each.first] }
      count = neiboring_lights.count("#")

      if current_light == "#"
        if((count==2)||(count==3))
          new_string << "#"
        else
          new_string << "."
        end
      else
        if(count==3)
          new_string << "#"
        else
          new_string << "."
        end
      end
    end
    new_string << "\n"
  end
  new_string
end

100.times do
  temp = string
  string = transform_string(temp)
end

puts string.count("#")
