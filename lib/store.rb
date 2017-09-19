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

  def current_inventory
    @inventory_record.last
  end

  def previous_inventory
    @inventory_record[-2]
  end

  def stock_check(item_name)
    current_inventory && current_inventory.items[item_name]
  end

  def amount_sold(item_name)
    current = current_inventory && current_inventory.quantity(item_name)
    return nil if current.nil?
    previous = previous_inventory && previous_inventory.quantity(item_name)
    return 0 if previous.nil?
    previous - current
  end

  def item_subtotal(name, quantity)
    quantity * current_inventory.cost(name)
  end

  def us_order(order)
    order.reduce(0) do |total, (item_name, quantity)|
      total + item_subtotal(item_name, quantity)
    end
  end

  def brazillian_order(order)
    us_order(order) * 3.08
  end

end
