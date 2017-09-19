require "minitest/autorun"
require "minitest/pride"
require "./lib/store"
require "./lib/inventory"

class StoreTest < Minitest::Test

  attr_reader :store
  def setup
    @store = Store.new("Hobby Town", "894 Bee St", "Hobby")
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
    assert_equal [], store.inventory_record
  end

  def test_store_can_add_inventories
    inventory = Inventory.new(Time.now)

    assert store.inventory_record.empty?

    store.add_inventory(inventory)

    refute store.inventory_record.empty?
    assert_equal inventory, store.inventory_record[-1]
  end

  def test_stock_check_returns_nil_when_no_inventory
    assert_nil store.stock_check("shirt")
  end

  def test_stock_check_returns_nil_when_item_is_not_recorded
    store.add_inventory(simple_inventory)

    assert_nil store.stock_check("gloop")
  end

  def test_stock_check_returns_quantity_and_cost_of_recorded_unavailable_item
    store.add_inventory(simple_inventory(quantity: 0))
    expected = { "quantity" => 0, "cost" => 2 }
    assert_equal expected, store.stock_check("shirt")
  end

  def test_stock_check_returns_quantity_and_cost_of_available_item
    store.add_inventory(simple_inventory(quantity: 0))
    expected = { "quantity" => 0, "cost" => 2 }
    assert_equal expected, store.stock_check("shirt")
  end

  def test_stock_check_adds_quantity_of_same_item_in_multiple_inventories
    store.add_inventory(simple_inventory(quantity: 3))
    store.add_inventory(simple_inventory(quantity: 1))

    expected = { "quantity" => 1, "cost" => 2 }
    assert_equal expected, store.stock_check("shirt")
  end


  def test_amount_sold_returns_nil_when_no_inventory
    assert_nil store.amount_sold("shirt")
  end

  def test_amount_sold_returns_nil_when_item_is_not_recorded
    store.add_inventory(simple_inventory)
    assert_nil store.amount_sold("gloop")
  end

  def test_amount_sold_returns_0_when_recorded_item_goes_unsold
    store.add_inventory(simple_inventory)
    assert_equal 0, store.amount_sold("shirt")
  end

  def test_amount_sold_returns_inventory_difference_when_item_sold
    store.add_inventory(simple_inventory(quantity: 3))
    store.add_inventory(simple_inventory(quantity: 1))

    assert_equal 2, store.amount_sold("shirt")
  end

  def test_amount_sold_returns_only_most_recent_difference
    store.add_inventory(simple_inventory(quantity: 100))
    store.add_inventory(simple_inventory(quantity: 3))
    store.add_inventory(simple_inventory(quantity: 1))

    assert_equal 2, store.amount_sold("shirt")
  end

  def simple_inventory(item_name: "shirt", quantity: 1, cost: 2)
    inventory = Inventory.new(Time.now)
    inventory.record_item({ item_name => { "quantity" => quantity, "cost" => cost } })
    inventory
  end

end
