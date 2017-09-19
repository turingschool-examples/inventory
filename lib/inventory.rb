require 'pry'

class Inventory

  attr_reader :date,
              :items

  def initialize(date)
    @date = date
    @items = Hash.new
  end

  def record_item(item)
    item.map do |key, value|
      @items.store(key, value)
    end
    # need to figure out how to merge hashes and adding values instead of overwriting them 
  end


end
