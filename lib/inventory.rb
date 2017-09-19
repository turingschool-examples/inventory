require 'date'
require './lib/item'

class Inventory
  attr_reader :date, :items, :item_name, :total_quantity, :cost

  def initialize(date)
    @date = date
    @items = {}
    @item_name = ''
    @all_items = []
    @total_quantity = 0
    @cost = 0
  end

  def record_item(item_info)

    item = Item.new(item_info)
    name = item.name
    cost = item.cost
    quantity = item.quantity
    
    #there's an issue with this setup based on iteration 3. you record_items with different names
    @all_items << item_info
    name = find_name(item_info)
    @cost = item_info.dig(name, 'cost')
    quantity = item_info.dig(name, 'quantity')
    @total_quantity += quantity

    return @items = item_info if @all_items.count == 1

     @items[name] = {'quantity' => @total_quantity, 'cost' => @cost}
  end

  def find_name(item_info)
    @item_name = item_info.keys.first
  end
end
