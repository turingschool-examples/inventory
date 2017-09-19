class Inventory

  attr_reader :date, :items
  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    @items.merge!(item) do |name, old_data, new_data|
      old_data["quantity"] += new_data["quantity"]
      old_data
    end
  end

  def quantity(item_name)
    items[item_name] && items[item_name]["quantity"]
  end

  def cost(item_name)
    items[item_name] && items[item_name]["cost"]
  end

end
