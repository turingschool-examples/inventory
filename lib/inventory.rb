require 'date'
class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date  = date
    @items = Hash.new
  end

  def record_item(hash)
    @items.merge!(hash) 
  end

  def record_item(item)
    @items.merge!(item)
  end
  
  def check_inventory(item)
    items.each {|key, val| return val if key == item}
  end
end
