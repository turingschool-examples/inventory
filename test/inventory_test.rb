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

  def test_inventory_has_items_as_empty_hash
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert_equal ({}), inventory.items
  end

  def test_invtory_stores_items
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.items

    assert_equal 1, inventory1.items.count
    assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), inventory1.items
  end

  def test_invtory_stores_items_with_updated_quantity
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})


    assert_equal ({"shirt" => {"quantity" => 60, "cost" => 15}}), inventory1.items
  end

  def test_amount_sold
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
    inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

    ace.add_inventory(inventory3)
    ace.add_inventory(inventory4)

    assert_equal 5, ace.amount_sold("hammer")
  end

end
