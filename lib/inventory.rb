require "date"

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end


  #this method both adds new and updates existing item hashes
  def record_item(item_qty_cost)
      # require "pry"; binding.pry
  item = item_qty_cost.keys[0]  #good
  qty_and_cost = item_qty_cost.values[0]  #good
  @items = {item => qty_and_cost}
  #good {"shirt" => {"quantity" => 50, "cost" => 15}}
  end

  def update_items(item_qty_cost)
    # require "pry"; binding.pry
      quantity = qty_and_cost.keys[0]  #"quantity"
      amount = qty_and_cost.values[0] #50

      quantities = {quantity => amount} #{"quantity"=>50}

      cost = qty_and_cost.keys[1]  # "cost"
      amount = qty_and_cost.values[1] #15
      costs = {cost => amount} # {"cost"=>15}

      # i want to be able to write over quanities.
      #items = {item => qty_and_cost}
      items[item][quantity] = items[item][quantity]  + items[item][quantity]  #100
      items[item][cost] = items[item][cost] + items[item][cost] #30
    end



end
