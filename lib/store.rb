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
    stock = inventory_record.detect do |inventory|
      inventory.items[item]
    end
    stock.items[item]
  end

  def amount_sold(item)
    stock = inventory_record.find_all do |inventory|
      inventory.items[item]
    end
    stock.reduce(0) do |thing1, thing2|
      if thing1 == 0
        thing1 = thing2
      else
        thing1 = thing1.items[item]["quantity"] - thing2.items[item]["quantity"]
      end
    end
  end
end
