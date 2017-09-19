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
    @inventory_record.first.items[item]
  end

  def amount_sold(item)
    all = @inventory_record.map do |inv|
      inv.items[item]
    end
    values = all.map do |h|
      h.values[0]
    end
    difference = values[0] - values[1]
  end

end
