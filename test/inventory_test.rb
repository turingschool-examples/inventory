require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require './lib/date'
require './lib/store'

class InventoryTest < Minitest::Test
  def test_inventory_exists
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory1
  end

  def test_store_has_record_of_inventory
    acme = Store.new("Acme", "324 Main St", "Grocery")

    assert_equal [], acme.inventory_record
  end

  def test_inventory
    acme = Store.new("Acme", "324 Main St", "Grocery")
    inventory1 = Inventory.new(@date)
    inventory2 = Inventory.new(@date)
    acme.add_inventory(inventory1)
    acme.add_inventory(inventory2)

    assert_equal 2, acme.inventory_record.count
  end

  def test_what_is_in_stock
    acme = Store.new("Acme", "324 Main St", "Grocery")

    assert_equal ({"quantity" => 60, "cost" => 15}), acme.stock_check("shirt")
  end

  def test_how_much_has_been_sold
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

  def test_internationally
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})

    assert_equal $620, ace.us_order({"miniature orc" => 30, "fancy paint brush" => 1})
  end


end
