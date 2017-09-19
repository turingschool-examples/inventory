require 'date'
class Inventory
  attr_reader :date, :items
  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(new_item)
    if items.has_key?(new_item.keys[0])
      items[new_item.keys[0]]["quantity"] += new_item.values[0]["quantity"]
      # items[new_item.keys[0]]["cost"] += new_item.values[0]["cost"]
    else
      items.merge!(new_item)
    end
  end
end
