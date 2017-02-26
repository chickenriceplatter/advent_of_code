require 'pry'

first_number_in_row = 1 + (1..3018).reduce(:+)

def offset(row_number, position)
  diff = position - 1
  range = ((row_number + 1)..(row_number + diff))
  offset = range.reduce(:+)
  offset
end

def first_number_in_row(row_number)
  return 1  if row_number == 1

  factor = row_number - 1
  total = 1 + (1..factor).reduce(:+)
  total
end

row = 3010

column = 3019

nth = first_number_in_row(row) + offset(row, column)

number = 20151125
multiple = 252533
divisor = 33554393

(nth - 1).times do
  product = number * multiple
  remainder = product % divisor

  number = remainder
end

binding.pry
