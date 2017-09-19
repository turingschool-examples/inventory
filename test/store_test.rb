require "minitest/autorun"
require "minitest/pride"
require "./lib/store"
require "./lib/inventory"

class StoreTest < Minitest::Test

  def test_store_has_a_name
    store = Store.new("Hobby Town", "894 Bee St", "Hobby")

    assert_equal "Hobby Town", store.name
  end

  def test_store_has_a_type
    store = Store.new("Ace", "834 2nd St", "Hardware")

    assert_equal "Hardware", store.type
  end

  def test_store_has_a_location
    store = Store.new("Acme", "324 Main St", "Grocery")

    assert_equal "324 Main St", store.address
  end

  def test_store_tracks_inventories
    store = Store.new("Ace", "834 2nd St", "Hardware")

    assert_equal [], store.inventory_record
  end

  def test_store_can_add_inventories
    store = Store.new("Ace", "834 2nd St", "Hardware")
    inventory = Inventory.new({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert store.inventory_record.empty?

    store.add_inventory(inventory)

    refute store.inventory_record.empty?
    assert_equal inventory, store.inventory_record[-1]
    assert_instance_of Inventory, store.inventory_record[0]
  end

  def test_it_can_add_multiple_inventories
    store = Store.new("Ace", "834 2nd St", "Hardware")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory2.record_item({"flies" => {"quantity" => 20, "cost" => 15}})

    store.add_inventory(inventory1)
    store.add_inventory(inventory2)

    assert_equal 2, store.inventory_record.count
    assert_equal 'flies', store.inventory_record.last.item_name
  end

  def test_it_can_check_stock_of_inventory
    store = Store.new("Ace", "834 2nd St", "Hardware")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
    store.add_inventory(inventory1)

    assert_equal 60, store.stock_check('shirt')
  end



end
