require 'pry'

class Inventory

  attr_reader :date,
              :items

  def initialize(date)
    @date = date
    @items = Hash.new
  end

  def record_item(item)
    @items.merge!(item)
  end

  

end
