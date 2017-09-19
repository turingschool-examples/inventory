require 'date'
class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(data)
    @items.merge!(data)

end

end
