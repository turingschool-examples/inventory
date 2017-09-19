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

  def test_items_starts_as_empty_hash
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    expected = inventory1.items
    actual = {}
    assert_equal expected, actual

  end

  
  def test_can_record_item_and_starts_empty
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal inventory1.items, {"shirt" => {"quantity" => 50, "cost" => 15}}
  end


end
