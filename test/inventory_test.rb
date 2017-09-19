require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test
  attr_reader :inventory1, :inventory2

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
    @inventory2 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_it_exists
    assert_instance_of Inventory, inventory1
  end

  def test_it_has_a_date_argument
   assert_instance_of Date, inventory1.date
  end

  def test_it_starts_with_no_items
    assert_instance_of Hash, inventory1.items
  end

  def test_you_can_record_items_in_inventory
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    expected = {"shirt" => {"quantity" => 50, "cost" => 15}}

    assert_instance_of Hash, inventory1.items
    assert_equal expected, inventory1.items
  end

  def test_you_can_record_multiple_items_into_inventory
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
    expected = {"shirt" => {"quantity" => 60, "cost" => 15}}

    assert_equal expected, inventory1.items
  end
end
