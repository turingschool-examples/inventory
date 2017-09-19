require './lib/inventory'

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
    inventory_record.map do |inventory|
      inventory.check_inventory(item)
    end.compact
  end

  def quantities(item)
    stock_check(item).map do |stock_list|
      stock_list["quantity"]
    end
  end

  def amount_sold(item)
    return 0 if stock_check(item).nil? || stock_check(item).count < 2
    subtract_quantities(item)
  end

  def subtract_quantities(item)
    quantities(item).reduce do |total, quantity|
      total -= quantity
    end
  end

  def find_cost(item)
    inventory_record.map do |inventory|
      inventory.item_cost(item)
    end.compact[0]
  end

  def us_order_num(order)
    order.map do |key, value|
      find_cost(key) * value
    end.sum
  end

  def us_order(order)
    "$#{us_order_num(order)}"
  end

  def brazilian_order_num(order)
    (us_order_num(order).to_f * 3.08).round(2)
  end

  def brazilian_order(order)
    "R$#{'%.2f' % brazilian_order_num(order)}"
  end

end
