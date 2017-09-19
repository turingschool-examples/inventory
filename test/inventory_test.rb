require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test
  def test_for_new_instance_of_date_in_inventory
    inventory1 = Inventory.new(Date.new(2017, 9, 8))

    assert_instance_of Date, inventory1.date
  end

  def test_that_items_is_empty_hash
    inventory1 = Inventory.new(Date.new(2017, 9, 8))

    assert_equal ({}), inventory1.items
  end

  def test_it_can_record_items
    inventory1 = Inventory.new(Date.new(2017, 9, 8))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), inventory1.items
  end

  def test_it_can_change_value_of_items
    inventory1 = Inventory.new(Date.new(2017, 9, 8))
    inventory1.record_item({"shirt" => {"quantity" => 60, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 60, "cost" => 15}}), inventory1.items
  end


end
