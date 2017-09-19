require "date"

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new(0)
  end

    def record_item(item_qty_cost)
    @items = item_qty_cost
  end



end
