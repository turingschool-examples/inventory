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
    inventory = @inventory_record.find do |inventory|
      inventory.item_name.downcase == item_name.downcase
    end
    inventory.items[item_name]['quantity']
  end

  def amount_sold(item_name)

  end

  def find_multiple_items_in_different_inventories(item_name)
    #choose the inventories that have the same item name
    @inventory_record.select do |inventory|
      inventory.item_name
  end
end
