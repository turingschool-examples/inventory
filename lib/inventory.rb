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

  def record_item(item_qty_cost)
  # require "pry"; binding.pry
    item = item_qty_cost.keys[0]  #good
    qty_and_cost = item_qty_cost.values[0]  #good

    # if there's nothing in the @items hash,
    #   just add the item.
      if items.empty?  ||  items[item] != item_qty_cost.keys
        @items = {item => qty_and_cost}
      else items[name] == item_qty_cost.keys
      #   see if there is already an item of the same name and add to the values
        quantity = qty_and_cost.keys[0]  #
        amount = qty_and_cost.values[0] #
        quantities = {quantity => amount} #
        @items = items[item][quantity]  + items[item][quantity]  #
      end
    end



end
