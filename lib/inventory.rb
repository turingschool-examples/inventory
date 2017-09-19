require "date"

class Inventory

  attr_reader :date

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end

  def items
    @items
  end

  def record_item(item_qty_cost)
  end



end
