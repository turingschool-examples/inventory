require 'date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def merge_item_quantities(old_quantity, new_quantity)
    old_quantity.merge(new_quantity) do |key, first_amount, second_amount|
      first_amount + second_amount
    end
  end

  def record_item(item_info)
    @items = @items.merge(item_info) do |item, old_value, new_value|
      old_quantity = old_value.select {|key,value| key == 'quantity'}
      new_quantity = new_value.select {|key,value| key == 'quantity'}
      require "pry"; binding.pry
    end

  end



end
