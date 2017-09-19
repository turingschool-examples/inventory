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
    @inventory_record.each do |inventory|
      if inventory.item_is_in_inventory?(item)
        return inventory.items.values[0]
      end
    end
  end

  def sort_inventories_by_date
    @inventory_record.sort_by {|inventory| inventory.date}
  end

  def amount_sold(item)
    last_inventory = sort_inventories_by_date[-1]
    next_to_last_inventory = sort_inventories_by_date[-2]
    next_to_last_inventory.retrieve_quantity(item) - last_inventory.retrieve_quantity(item)
  end

  def us_order(order_info)
    purchased_items = order_info.keys
    @inventory_record.each do |inventory|
        inventory.retrieve_item_costs(purchased_items)
    end
  end


end
