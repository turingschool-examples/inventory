require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require './lib/date'

class InventoryTest < Minitest::Test

  def test_it_exists
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory
  end

  def test_it_has_a_date
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Date, inventory.date
  end

  def test_it_has_empty_items_hash_has_default
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_equal({}, inventory.items)
  end



end
