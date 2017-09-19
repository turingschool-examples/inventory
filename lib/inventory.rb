class Inventory

  attr_reader :date
  attr_accessor :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    keys = item.keys
    key = keys[0]
    values = item.values
    value = values[0]
    if items[key] != key
      @items[key] = value
    else
      @items.merge!(item){|key, oldval, newval| newval + oldval}
    end
  end

end
