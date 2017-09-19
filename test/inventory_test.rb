require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test

  def test_it_exists
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory
  end

  def test_date_pulls_attribute
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Date, inventory1.date
  end

  def test_it_has_items

    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

    assert_equal {"shirt" => {"quantity" => 50, "cost" => 15}, inventory1.items
  end
end
