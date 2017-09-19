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

    query_items = inventory_record.map do |inventory|
      inventory.items.select {|k, v| k.include?('shirt')}
    end
    query_items[0].values[0]
  end

  def amount_sold(item_name)
    #take two most recent inventory dates
    sorted_inventories = sort_inventory_by_date
    newest_inventory = sorted_inventories[0]
    second_newest_inventory = sorted_inventories[1]

    new_count = newest_inventory.items[item_name]["quantity"]
    old_count = second_newest_inventory.items[item_name]["quantity"]

    old_count - new_count
  end

  def sort_inventory_by_date
    sorted_inventory= @inventory_record.sort_by do |inventory|
      inventory.date.day
    end
    sorted_inventory.reverse
  end
end
