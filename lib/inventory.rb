require 'date'
class Inventory

  attr_reader :date, :items

  def initialize(date)
    @date = date
    @items = {}
  end



end
