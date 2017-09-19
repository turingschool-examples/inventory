require 'date'

class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    # Add the item to the inventory hash 
    items.merge!(item) {|k,v1,v2| v1+v2}
  end

end
