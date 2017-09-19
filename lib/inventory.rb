class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    @items.merge!(item)
  end

  def check_inventory(item)
    items.each do |key, value|
      return value if key == item
    end
  end

end
