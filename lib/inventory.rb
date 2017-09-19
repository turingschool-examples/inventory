
class Inventory

attr_reader :date ,:items, :stock

  def initialize(date)
    @date = date
    @items = {}
    @inventory_record = []
  end

  def date
    Time.new(@date.year, @date.month, @date.day)
  end

  def record_item(item)
      item.map do |article, amount|
        @items[article] = amount
      end
  end

  def add_inventory(inventory)
  @inventory_record << inventory
  end

end
