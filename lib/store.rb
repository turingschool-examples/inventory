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

  def current_inventory
    @inventory_record.last
  end

  def stock_check(item_name)
    current_inventory && current_inventory.items[item_name]
  end

end
