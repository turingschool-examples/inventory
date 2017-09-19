require 'date'

class Inventory
  attr_reader :date, :items, :item_name

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item_info)
    item_name(item_info)
    @items.merge!(item_info)
  end

  def item_name(item_info)
    @item_name = item_info.keys.first
  end
end
