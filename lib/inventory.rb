class Inventory

  attr_reader :date
  attr_accessor :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    if @items.empty? || key_already_here?(item)
      @items = @items.merge(item)
    else
      keys = item.keys
      key = keys[0]
      original_quantity = @items[key]['quantity']
      added_quantity = item[key]['quantity']
      @items[key]["quantity"] = original_quantity + added_quantity
    end
  end

  def key_already_here?(item)
    keys = item.keys
    key = keys[0]
    if @items.any? {|k, value| k == key}
      false
    else
      true
    end
  end
end
