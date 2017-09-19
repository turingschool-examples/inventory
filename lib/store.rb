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

  def stock_check(item_name)
    inventory_record.reduce(nil) do |past_data, inventory|

      current_data = inventory.items[item_name]
      if current_data.nil?
        past_data
      elsif past_data.nil?
        current_data
      else
        past_data["quantity"] += current_data["quantity"]
        past_data
      end

    end
  end

end
