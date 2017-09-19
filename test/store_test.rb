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
    inventory = Inventory.new(Time.now)

    assert store.inventory_record.empty?

    store.add_inventory(inventory)

    refute store.inventory_record.empty?
    assert_equal inventory, store.inventory_record[-1]
  end

  def test_stock_check_returns_nil_when_item_is_not_recorded
    store = Store.new("Ace", "834 2nd St", "Hardware")
    assert_nil store.stock_check("shirt")
  end

  def test_stock_check_returns_quantity_and_cost_of_recorded_unavailable_item
    inventory = Inventory.new(Time.now)
    shirt_data = { "quantity" => 0, "cost" => 2 }
    inventory.record_item({ "shirt" => shirt_data })

    store = Store.new("Ace", "834 2nd St", "Hardware")
    store.add_inventory(inventory)
    assert_equal shirt_data, store.stock_check("shirt")
  end

  def test_stock_check_returns_quantity_and_cost_of_available_item
    inventory = Inventory.new(Time.now)
    shirt_data = { "quantity" => 1, "cost" => 2 }
    inventory.record_item({ "shirt" => shirt_data })

    store = Store.new("Ace", "834 2nd St", "Hardware")
    store.add_inventory(inventory)
    assert_equal shirt_data, store.stock_check("shirt")
  end

  def test_stock_check_adds_quantity_of_same_item_in_multiple_inventories
    inventory_1 = Inventory.new(Time.now)
    inventory_2 = Inventory.new(Time.now)
    inventory_1.record_item({ "shirt" => { "quantity" => 3, "cost" => 2 } })
    inventory_2.record_item({ "shirt" => { "quantity" => 1, "cost" => 2 } })

    store = Store.new("Ace", "834 2nd St", "Hardware")
    store.add_inventory(inventory_1)
    store.add_inventory(inventory_2)

    expected = { "quantity" => 1, "cost" => 2 }
    assert_equal expected, store.stock_check("shirt")
  end

end
