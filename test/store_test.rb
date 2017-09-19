require "minitest/autorun"
require "minitest/pride"
require "./lib/store"
require "./lib/inventory"

class StoreTest < Minitest::Test

  def setup
    @store = Store.new("Acme", "324 Main St", "Grocery")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 60, "cost" => 15}})
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})
    @store.add_inventory(inventory1)
    @store.add_inventory(inventory2)
  end

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
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert store.inventory_record.empty?

    store.add_inventory(inventory)

    refute store.inventory_record.empty?
    assert_equal inventory, store.inventory_record[-1]
  end

  def test_stock_check_finds_info_about_item_in_inventory
    # assert_equal ({"quantity" => 60, "cost" => 15}), @store.stock_check('shirt')

    assert_equal ({"quantity" => 40, "cost" => 30}), @store.stock_check('shoes')
  end

end
