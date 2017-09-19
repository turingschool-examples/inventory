require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'


class InventoryTest < Minitest::Test
  attr_reader :inventory_1

  def setup
    @inventory_1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_inventory_class_exists
    assert_instance_of Inventory, @inventory_1
  end



end
