require 'date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def merge_item_quantities(old_values, new_values)
    old_quantity = old_values.select {|key,value| key == 'quantity'}
    new_quantity = new_values.select {|key,value| key == 'quantity'}
    old_quantity.merge(new_quantity) do |key, old_quantity, new_quantity|
      old_quantity + new_quantity
    end
  end

  def item_cost(new_values)
    new_values.select {|key,value| key == 'cost'}
  end

  def record_item(item_info)
    @items = @items.merge(item_info) do |item, old_values, new_values|
      updated_quantity = merge_item_quantities(old_values, new_values)
      cost = item_cost(new_values)
      item_info[item] = updated_quantity.merge(cost)
    end
  end

  def item_is_in_inventory?(item)
    @items.keys[0] == item
  end

  def retrieve_quantity(item)
    quantity_info = @items[item].first
    quantity = quantity_info[1]
  end

  def retrieve_item_costs(item_list)
    item_list.map do |item|
      cost = item_cost(@items[item])
      cost['cost']
    end
  end

end
