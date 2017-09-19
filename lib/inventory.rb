class Inventory
  attr_reader :date, :items
  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    item.each do |key, value|
      if items.has_key?(key)
        items[key]["quantity"] = item[key]["quantity"] + items[key]["quantity"]
      else
        items[key] = value
      end
    end
  end

end
