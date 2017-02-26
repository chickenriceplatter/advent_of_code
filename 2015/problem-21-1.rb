require 'pry'

string = File.read("21-1-input.txt")

array = string.strip.split("---")

first_array = array.first.strip.split("\n")
second_array = array[1].strip.split("\n")
third_array = array[2].strip.split("\n")
fourth_array = array.last.strip.split("\n")

enemy = {}

first_array.each do |line|
  temp = line.split(":")
  enemy[temp.first.strip.downcase.to_sym] = temp.last.strip.to_i
end

weapons = {}

second_array.each do |line|
  temp = line.split(" ")
  weapons[temp.first.strip.downcase.to_sym] = {cost: temp[1].strip.to_i, damage: temp[2].strip.to_i }
end

armor = {}

third_array.each do |line|
  temp = line.split(" ")
  armor[temp.first.strip.downcase.to_sym] = {cost: temp[1].strip.to_i, armor: temp.last.strip.to_i}
end

rings = {}

fourth_array.each do |line|
  temp = line.split(" ")
  ability = {cost: temp[1].strip.to_i}

  if temp.first.include?("age")
    ability[:damage] = temp[2].strip.to_i
  else
    ability[:armor] = temp.last.strip.to_i
  end

  rings[temp.first.strip.downcase.to_sym] = ability
end

items = weapons.merge(armor).merge(rings)

def do_battle(enemy, player)
  enemy_hit_points = enemy[:"hit points"]
  player_hit_points = player[:"hit points"]

  enemy_damage = enemy[:damage] - player[:armor]
  player_damage = player[:damage] - enemy[:armor]

  if enemy_damage < 0
    enemy_damage = 0
  end

  if player_damage < 0
    player_damage = 0
  end

  loop do

    enemy_hit_points -= player_damage

    if enemy_hit_points <= 0
      puts "player: #{player_hit_points}, enemy: #{enemy_hit_points}"
      return "player"
    end

    player_hit_points -= enemy_damage

    if player_hit_points <= 0
      puts "player: #{player_hit_points}, enemy: #{enemy_hit_points}"
      return "enemy"
    end

  end
end

possibilities = []

weapons.keys.each do |weapon|
  (armor.keys << nil).each do |armor|
    (rings.keys.push(nil,nil)).combination(2).each do |rings|
      possibilities << [weapon, armor, rings].flatten
    end
  end
end

lowest_cost = 10000

winning_combination = []

possibilities.each do |p|
  p = p.compact

  armor = 0
  damage = 0
  cost = 0

  p.each do |key|
    item = items[key]
    cost += item[:cost]
    if item.has_key?(:damage)
      damage += item[:damage]
    end

    if item.has_key?(:armor)
      armor += item[:armor]
    end
  end

  player = {}
  player[:"hit points"] = 100
  player[:damage] = damage
  player[:armor] = armor

  result = do_battle(enemy, player)

  if result == "player"
    if cost < lowest_cost
      lowest_cost = cost
      winning_combination = p
    end
  end
end

puts lowest_cost


binding.pry

