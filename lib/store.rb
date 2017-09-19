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

  def find_difference(stock, item)
    stock.reduce(0) do |item1, item2|
      if item1 == 0
        item1 = item2
      else
        item1 = item1.items[item]["quantity"] - item2.items[item]["quantity"]
      end
    end
  end

  def find_all_items_in_inventory(item)
    stock = inventory_record.find_all do |inventory|
      inventory.items[item]
    end
  end

  def amount_sold(item)
    stock = find_all_items_in_inventory(item)
    find_difference(stock, item)
  end

  def us_order(order)
    purchases = order.keys
    
    end
  end

end
