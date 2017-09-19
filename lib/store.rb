require 'DATE'

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
    inventory = inventory_record.find do |inventory|
      inventory.items[item]
    end
    inventory.items[item]
  end

  def amount_sold(item)
    inventory = inventory_record.find_all do |inventory|
      inventory.items[item]
    end
    sorted = inventory.sort_by do |inventory| 
    inventory.date
    end
    (sorted.first.items[item]["quantity"] - sorted.last.items[item]["quantity"])
  end

  def method_name
    
  end

end

