require "date"

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end


#this method both adds new and updates existing item hashes
  def record_item(item_qty_cost)
require "pry"; binding.pry
  key = item_qty_cost.keys[0]  #good
  value = item_qty_cost.values[0]  #good
  items = {key => value} #good

  inner_key = value.keys[0] #"quantity
  inner_value = value.values # takes both qty and costs's numbers
  value = {inner_key => inner_value}  #{"quantity"=>[50, 15]}

  items[key] = value  #{"quantity"=>[50, 15]}
  items[key][inner_key] = inner_value  #nil...
=begin
Create the hash:
hash = {:item1 => 1}

Add a new item to it:
hash[:item2] = 2
=end

  end



end
