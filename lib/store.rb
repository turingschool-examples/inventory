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

  def stock_check(item_name)
    @inventory_record.reduce {|inventory| inventory.items[item_name]}
  end

  def amount_sold(item)
      stock = @inventory_record.find_all {|inventory| inventory.items[item]}
      stock.select {|inventory| inventory.items.key(item)}
  end

end
