require 'inventory'

class Store
  attr_reader :name,
              :address,
              :type,
              :inventory_record
              :record_item

  def initialize(name, address, type)
    @name = name
    @address = address
    @type = type
    @inventory_record = []
  end

  def add_inventory(inventory)
    @inventory_record << inventory
  end

  def stock_check(shirt)
    shirt = ({"quantity" => 60, "cost" => 15})
  end

  def amount_sold(hammer)
    @record_item
  end

end
