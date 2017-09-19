require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require "./lib/date"
require "pry"
class InventoryTest < Minitest::Test

  def test_an_inventory_exists
    inventory = Inventory.new('some data')

    assert_instance_of Inventory, inventory
  end

  def test_inventory_can_hold_date
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_equal '2017-09-18 00:00:00 -0600', inventory1.date
  end


end
