require 'date'
class Inventory
  attr_reader :date, :items
  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(data)
    data.each_pair do |key, value|
      items[key] = value
    end
  end

end
