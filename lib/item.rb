class Item
  attr_reader :name, :quantity, :cost

  def initialize(info)
    @name = info.keys.first
    @quantity = info.dig(name, 'quantity')
    @cost = info.dig(name, 'cost')
  end
  
end
