class Inventory
  attr_reader :date, :items
  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    item.each do |key, value|
      items[key] = value
    end
    items
  end

end
