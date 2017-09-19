require 'date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item_info)
    # @items.reduce({}) do |@item, item_info|
    #   @items.merge(item_info) do |quantity, cost|
    @items = @items.merge(item_info) do |item, old_value, new_value|
      old_value.merge(new_value) do |key, quantity, cost|
        require "pry"; binding.pry
        old_quantity + new_quantity
      end
      old_value.merge(new_value) do |cost, old_cost, new_cost|
        old_cost + new_cost
      end
    end
  end



end
