require 'Date'

class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end


  def record_item(argument)
    @items.merge!(argument) do |value|
      value.map { |v| v["quantity"] }.sum
    end
  end
  

end
