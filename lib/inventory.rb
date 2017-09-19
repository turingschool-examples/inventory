require_relative 'date'
require 'pry'

class Inventory
  attr_accessor :date

  def initialize(date)
    @date = date
    @record_item = []
  end

  def record_item(inventory)
    @record_item << inventory
  end
end
