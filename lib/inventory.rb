require "date"

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end

  def record_item(item_qty_cost)
    #this method both adds new and updates existing item hashes
    item_qty_cost[item] = qty_and_cost
    qty_and_cost[]

  items = {:item1 => 1}
  items[:key] = val
  items[outerkey][innerkey] = innerval
=begin
Create the hash:
hash = {:item1 => 1}

Add a new item to it:
hash[:item2] = 2
=end

  end



end
