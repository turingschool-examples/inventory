require "date"

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end


  #this method both adds new and updates existing item hashes
  def record_item(item_qty_cost)

  key = item_qty_cost.keys[0]  #good
  value = item_qty_cost.values[0]  #good
  items = {key => value} #good
require "pry"; binding.pry
  inner_key = value.keys[0]  #"quantitiy"
  inner_value = value.values[0] #50
  value_1 = {inner_key => inner_value} # {"quantity"=>50}
  inner_key = value.keys[1] #cost
  inner_value = value.values[1] #15
  value_2 = {inner_key => inner_value} # {"cost"=>15}

  items[key] = value_1
  items[key] = value_2
  items[key][inner_key] = inner_value

  end



end
