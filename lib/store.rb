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
    @inventory_record.find_all do |inventory|
      inventory.items.key?(item)
    
    end

  end

end
