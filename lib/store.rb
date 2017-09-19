require './lib/inventory'
require 'pry'

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
    stock_check(item).map do |stock_list|
      stock_list["quantity"]
    end
  end

  def amount_sold(item)
    return 0 if stock_check(item).nil? || stock_check(item).count < 2
    quantities(item).reduce do |total, quantity|
      total -= quantity
    end
  end

  def us_order(order)

  end

end
