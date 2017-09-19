require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

require 'pry'


class InventoryTest < Minitest::Test
  def test_it_exists
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory1
  end

  def test_inventory_1_initializes_with_date
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Date, inventory1.date
  end

  def test_inventory_1_initializes_with_empty_items_hash
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    expected = {}
    
    assert_equal expected, inventory1.items
  end


end
