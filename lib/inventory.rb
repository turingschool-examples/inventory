require 'date'

class Inventory
  attr_reader :date, :items, :item_name

  def initialize(date)
    @date = date
    @items = {}
    @item_name = ''
  end

  def record_item(item_info)
    find_name(item_info)
    @items.merge!(item_info)
  end

  def find_name(item_info)
    @item_name = item_info.keys.first
  end
end
