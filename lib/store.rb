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
end
