require 'date'
require 'pry'
class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    if @items.empty?
      @items = item
    elsif @items.keys == item.keys
      @items.merge!(item){|key, oldval, newval| newval.merge!(oldval){|key, oldval, newval| oldval + newval } }
    else
    @items.merge(item)
    end

  end



end
