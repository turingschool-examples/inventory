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

  def check_for_item_in_inventory(inventory, item)
    if inventory.items.keys[0] == item
      stock_info = inventory.items.values[0]
    end
  end

  def stock_check(item)
    stock_info = @inventory_record.map do |inventory|
      check_for_item_in_inventory(inventory, item)
      require "pry"; binding.pry
    end
    stock_info[0]
  end

end
