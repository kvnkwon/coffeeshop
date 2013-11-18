require_relative 'calculate'
item_price = {
  1 => ["Light", 5.00, 0],
  2 => ["Medium", 7.50, 0],
  3 => ["Dark", 9.75, 0]
}

calculate = Calculate.new(item_price)

puts "==== Welcome to the Coffee Emporium! ===="
puts "Prices"
puts "1. #{item_price[1][0]}, #{item_price[1][1]}."
puts "2. #{item_price[2][0]}, #{item_price[2][1]}."
puts "3. #{item_price[3][0]}, #{item_price[3][1]}."
puts "4. Complete Sale"
calculate.get_selection
calculate.change_owed
