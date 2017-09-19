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

  def item_is_in_inventory?(inventory, item)
    inventory.items.keys[0] == item
  end

  def stock_check(item)
    @inventory_record.each do |inventory|
      if item_is_in_inventory?(inventory, item)
        return inventory.items.values[0]
      end
    end
  end

  def sort_inventories_by_date
    @inventory_record.sort_by {|inventory| inventory.date}
  end

  def retrieve_quantity(inventory, item)
    item_info = last_inventory.items[item]
    quantity_info = item_info.first
    quantity = quantity_info[1]
  end

  def amount_sold(item)
    last_inventory = sort_inventories_by_date[-1]
    next_to_last_inventory = sort_inventories_by_date[-1]

    item_info = last_inventory.items[item]
    require "pry"; binding.pry
  end

end
