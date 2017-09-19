require "./lib/date"
require "pry"
class Inventory

attr_reader :date ,:items

  def initialize(date)
    @date = date
    @items = {}
  end

  def date
    Time.new(@date.year, @date.month, @date.day)
  end

  def record_item(item)
      hashes = item.each do |article, amount|
        @items[article] = amount
      end
      hashes
  end
end
