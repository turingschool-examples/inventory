require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require "./lib/date"
require "./lib/store"
require "pry"
class InventoryTest < Minitest::Test

  def test_an_inventory_exists
    inventory = Inventory.new('some data')

    assert_instance_of Inventory, inventory
  end

  def test_inventory_can_hold_date
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_equal '2017-09-18 00:00:00 -0600', inventory1.date
  end

  def test_items_starts_as_empty_hash
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    expected = inventory1.items
    actual = {}
    assert_equal expected, actual

  end


  def test_can_record_item_and_starts_empty
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal inventory1.items, {"shirt" => {"quantity" => 50, "cost" => 15}}
  end

  def test_it_adds_quantity_but_not_cost
  inventory1 = Inventory.new(Date.new(2017, 9, 18))
  inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
  inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

  expected = {"shirt" => {"quantity" => 60, "cost" => 15}}

  assert_equal expected, inventory1.items
  end

  def test_inventory_record_matches_store
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

    acme = Store.new("Acme", "324 Main St", "Grocery")
    acme.add_inventory(inventory1)
    acme.add_inventory(inventory2)

    expected = acme.inventory_record

    assert_equal expected, acme.inventory_record
  end

  def test_inventory_stock_can_be_checked
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

    acme = Store.new("Acme", "324 Main St", "Grocery")
    acme.add_inventory(inventory1)
    acme.add_inventory(inventory2)

    assert_equal acme.stock_check("shirt"), {"quantity" => 10, "cost" => 15}

   end


end
