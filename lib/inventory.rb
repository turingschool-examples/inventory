require 'date'

class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    items.merge!(item) do |_, old_hsh, new_hsh|
      old_hsh.merge(new_hsh) { |_, old_val, new_val| old_val + new_val }
    end
  end
end
