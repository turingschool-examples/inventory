require 'date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item_info)
    @items.reduce({}) do |sum, item_info|

    @items = @items.merge(item_info) {|key, old_value, new_value| old_value + new_value}
  end



end
