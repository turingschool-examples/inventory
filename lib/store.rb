class Store

  attr_reader :name,
              :address,
              :type,
              :inventory_record

  def initialize(name, address, type)
    @name             = name
    @address          = address
    @type             = type
    @inventory_record = []
  end

  def add_inventory(inventory)
    @inventory_record << inventory
  end

  def stock_check(item)
    inventory_record.map {|inv| inv.check_inventory(item)}
  end

  def amount_sold(item)
    item_count = stock_check(item).map {|list| list['quantity']}
    item_count.inject {|total, quantity| total -= quantity}
  end

  def us_order(item)
    item.map {|item, value| cost(item) * value}.sum
  end

  def print_us_order(item)
    return "$#{us_order(item)}"    
  end

  def cost(item)
    inventory_record.flat_map {|inv| inv.item_cost(item)}[0]
  end

  def brazilian_order(item)
    return "R$#{'%.2f' % (us_order(item).to_f * 3.08).floor(2)}"
  end
end
