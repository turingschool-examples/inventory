class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    @items.merge!(item)
  end

end
