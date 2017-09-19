class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item_information)
    item_name = item_information.keys.first
    item_data = item_information.values.first
    return @items[item_name] = item_data unless @items.keys.include?(item_name)

    update_item_quantity(item_name, item_data)
  end

  def update_item_quantity(item_name, item_data)
    @items[item_name]["quantity"] += item_data["quantity"]
  end

end
