class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(hash)
    hash.each_pair do |key, value|
      items[key] = value
    end
  end
end
