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

  def find_invoice(item)
    @inventory_record.find_all do |inventory|
      inventory.items.key?(item)
    end
  end

  def stock_check(item)
    find_invoice(item).items.values
  end

  #i understand this method is not working, but i am trying to create
  # an array up above with the inventory instances that match the given key valu
  # then I am trying to access the items hash and then access the value

  def invoice_date?(inventory)
    #i would write this method to calculate the date is later?
  end

  def amount_sold(item)
    # I would check to see if the date is older use the invoice date method
    # then i would use the stock check method to return the value of the item
    # this i would acccess the quanity and subtract
  end
end
