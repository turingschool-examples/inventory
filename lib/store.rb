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
    #go to
    inventory = @inventory_record.find do |inventory|
      inventory.item_name.downcase == item_name.downcase
    end
    

  end

end
