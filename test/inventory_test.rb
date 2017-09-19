require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'


class InventoryTest < Minitest::Test
  def test_it_exists
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory
  end


end
