require 'date'
class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date  = date
    @items = Hash.new
  end

  def record_item(hash)
    if @items.empty?
       @items.merge!(hash)
    else
      @items.merge!(hash) do |key, one, two| 
        {"quantity" => one.values[0] += two.values[0], 'cost' => two.values[1]}
      end
    end
  end
  
  def check_inventory(item)
    items.each {|key, val| return val if key == item}
  end

  def item_cost(item)
    items.each {|key, value| return value["cost"] if key == item}
  end
end
