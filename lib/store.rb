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

  def stock_check(string)
    @inventory_record.map do |inventory|
      inventory.map do |i|
        i.include?(string)
      end
    end
  end
end
