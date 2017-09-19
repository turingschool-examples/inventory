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
    end
  end

  def quantities(item)
    puts stock_check(item).inspect
    stock_check(item).map do |stock_list|
      stock_list['quantity']
    end
  end

  def amount_sold(item)
    return 0 if stock_check(item).nil? || stock_check(item).count < 2
    stock_check(item).reduce do |total, stock_list|
      total -= stock_list['quantity']
    end
  end

end
