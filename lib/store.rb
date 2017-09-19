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
    inventory = find_inventory_with_item(item)
    inventory.items[item]
  end

  def find_inventory_with_item(item)
    inventory_record.find do |inventory|
      inventory.items.keys.include?(item)
    end
  end

end
