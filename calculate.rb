require 'date'
class Calculate
  def initialize(item_price)
    @item_price = item_price
    @subtotal = 0
    @sale_complete = false
  end

  def get_selection
    while @sale_complete != true
      puts "Make a selection:"
      selection = gets.chomp
      
      if (1..3).to_a.include?(selection.to_i)
        quantity = get_quantity
        add_item(selection.to_i, quantity.to_i)
      elsif selection.to_i == 4
        sale_complete
      else
        puts "Invalid input. Try again."
        get_selection
      end
    end
  end

  def get_quantity
    puts "How many bags?"
    quantity = gets.chomp
    
    if quantity.to_i <= 0 || quantity =~ /([a-zA-Z])/
      puts "Invalid input. Try again."
      quantity = get_quantity
    end

    quantity
  end

  def add_item(selection, quantity)
    if [1,2,3].include?(selection)
      @subtotal += @item_price[selection][1] * quantity #selection refers to 1, 2, 3 in the item_price(rows)
      
      #[1] refers to the 2nd column in item_price which would be: the prices.
      @item_price[selection][2] += quantity
      puts "Subtotal: $#{sprintf('%.2f', @subtotal)}"
    end
  end

  def sale_complete
    @sale_complete = true
    puts "=== Sale Complete ===\n"
    (1..3).each do |item|
      if @item_price[item][2] != 0
        puts "#{@item_price[item][0]} #{@item_price[item][2]}"
      end
    end
    puts "Subtotal: $#{sprintf('%.2f', @subtotal)}"
  end

  def change_owed
    puts "What is the amount given?"
    given = gets.chomp

    if given.to_f <= 0 || given =~ /[a-zA-Z]/
      puts "Invalid input. Please try again."
      change_owed
    end

    if @subtotal.to_f <= given.to_f
      change = given.to_f - @subtotal.to_f
      puts "Thank you! The change given will be $#{sprintf('%.2f', change)}"
      puts "Date: " + Time.new.strftime("%Y %B %d, %I:%M%p")
      abort
    else
      change = @subtotal.to_f - given.to_f
      puts "Customer still needs to pay $#{sprintf('%.2f', change)}!"
      change_owed
    end
  end
end