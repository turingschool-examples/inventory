require 'Date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end


  def record_item(argument)
    @items.merge!(argument) do |key,value|
      @items["shirt"]["quantity"] += argument["shirt"]["quantity"]
    end
  end





end
