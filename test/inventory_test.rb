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

  def test_inventory_has_a_date
    expected = Date.new(2017, 9, 18)

    assert_instance_of Date, @inventory_1.date
    assert_equal expected, @inventory_1.date
  end

  def test_inventory_has_items_and_is_empty_on_initialization
    assert_instance_of Hash, @inventory_1.items
    assert @inventory_1.items.empty?
  end



end
