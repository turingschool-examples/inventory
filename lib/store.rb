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
    @inventory_record.detect do |inv|
      inv.items[item]
    end.items.values[0]
  end

  def amount_sold(item)
    q = determine_quantities(item)
    (q[0]["quantity"]) - (q[1]["quantity"])
  end

  def determine_quantities(item)
    list_invoices_with_item(item).map do |inv|
      inv.items[item]
    end
  end

  def list_invoices_with_item(item)
    @inventory_record.find_all do |inv|
      inv.items.keys.include?(item)
    end
  end

end
