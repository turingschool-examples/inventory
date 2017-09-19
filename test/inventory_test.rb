require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test

  def test_inventory_exists
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory
  end

  def test_inventory_has_date
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Date, inventory.date
  end

  def test_inventort_has_items_as_empty_hash
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_equal ({}), inventory.items
  end
end
