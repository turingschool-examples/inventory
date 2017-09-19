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

  def previous_inventory
    @inventory_record[-2]
  end

  def stock_check(item_name)
    current_inventory && current_inventory.items[item_name]
  end

  def amount_sold(item_name)
    current_stock = current_inventory && current_inventory.stock(item_name)
    return nil if current_stock.nil?
    previous_stock = previous_inventory && previous_inventory.stock(item_name)
    return 0 if previous_stock.nil?
    previous_stock - current_stock
  end

end
