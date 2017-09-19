require 'date'
class Inventory
  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = Hash.new
  end

  def record_item(hash)
    @items = hash
  end

end
