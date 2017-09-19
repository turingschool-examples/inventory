class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    item_name = item.keys.first
    item_data = item.values.first
    return @items[item_name] = item_data unless @items.keys.include?(item_name)

    update_item_data(item_name, item_data)
  end

  def update_item_data(item_name, item_data)
    item_data.each_pair { |key, value| @items[item_name][key] += value }
  end

end
