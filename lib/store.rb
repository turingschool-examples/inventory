require 'bigdecimal'
class Store

  attr_reader :name,
              :address,
              :type,
              :inventory_record

  def initialize(name, address, type)
    @name = name
    @address = address
    @type = type
    @inventory_record = []
  end

  def add_inventory(inventory)
    @inventory_record << inventory
  end

  def stock_check(item)
    inventory = stock(item)
    inventory.items[item]
  end

  def stock(item)
    inventory_record.find do |inventory|
      inventory.items[item]
    end
  end

  def amount_sold(item)
    inventory = find_inventory(item)
    sorted = sort_by_date(inventory)
    difference(sorted, item)
  end

  def find_inventory(item)
    inventory_record.find_all do |inventory|
      inventory.items[item]
    end
  end

  def difference(sorted, item)
    (sorted.first.items[item]["quantity"] - sorted.last.items[item]["quantity"])
  end

  def sort_by_date(inventory)
    inventory.sort_by {|inventory| inventory.date}
  end

  def us_order(order)
    inv = order_items(order)
    total = 0
    total += us_conversion(inv.flatten.first, order)
    total
  end

  def us_conversion(inventory, order)
    total = 0
    order.each_pair do |key, value|
      total += (inventory.items[key]["cost"] * value)
    end
    total
  end

  def brazilian_order(order)
    (us_order(order) * 3.08).round(2)
  end

  def order_items(order)
    order.keys.map {|key| find_inventory(key)}
  end
end
