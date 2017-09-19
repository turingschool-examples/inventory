require 'date'

class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item_info)
    @items.merge!(item_info)
  end

end
