require_relative 'inventory'

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
    item_a = {"hammer" => {"quantity" => 20, "cost" => 20}}
    amount_sold = (item_a["hammer"]["quantity"] -15)
  end

  def us_order(items)
  end

end
