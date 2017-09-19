require "minitest/autorun"
require "minitest/pride"
require "date"
require './lib/inventory'

class InventoryTest < Minitest::Test

  attr_reader :inventory1

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_inventory_exists
    assert_instance_of Inventory, inventory1
  end

  def test_inventory_has_a_date
    assert_equal Date.new(2017, 9, 18), inventory1.date
  end

  def test_inventory_has_items
    assert_instance_of Hash, inventory1.items
  end

  def test_inventory_can_record_new_items
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), inventory1.items
  end

  def test_it_can_check_inventory_for_item
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal ({"quantity" => 50, "cost" => 15}), inventory1.check_inventory("shirt")
  end

end
