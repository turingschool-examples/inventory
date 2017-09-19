require 'date'
require 'pry'
class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def same_item(item)
    @items.merge!(item) do |key, oldval, newval|
      newval.merge!(oldval){|key, oldval, newval| key == "cost" ? oldval : oldval + newval }
    end
  end


  def record_item(item)
    if @items.empty?
      @items = item
    elsif same_item(item)
    else
    @items.merge(item)

    end

  end





end
