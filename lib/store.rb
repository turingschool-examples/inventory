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

  def inventory_record
    @inventory_record
  end

  def stock_check(item)
    @inventory_record.find{|inventory| inventory[:item] = item }
  end

  def amount_sold
    @inventory.
end
