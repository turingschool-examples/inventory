require './lib/inventory'
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
      inventory = stock(item)
      inventory.items[item]
    end

    def stock(item)
      inventory_record.find do |inventory|
        inventory.items[item]
      end
    end

    def amount_sold(item)
      @final = []
      @inventory_record.find_all do |inventory|
        @final << inventory.items[item]
        @final
    end
  end
end
