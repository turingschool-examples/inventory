require "minitest/autorun"
require "minitest/pride"
require "./lib/store"
require "./lib/inventory"

class StoreTest < Minitest::Test

  def setup
    @acme = Store.new("Acme", "324 Main St", "Grocery")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})
    inventory3 = Inventory.new(Date.new(2017, 9, 20))
    @acme.add_inventory(inventory1)
    @acme.add_inventory(inventory3)
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

  def test_stock_check_returns_item_information_if_item_is_in_any_inventory
    actual = @acme.stock_check("shirt")
    expected = {"quantity" => 60, "cost" => 15}

    assert_equal expected, actual
  end

  def test_amount_sold_returns_the_amount_sold_between_two_dates
    skip
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
    inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

    ace.add_inventory(inventory3)
    ace.add_inventory(inventory4)

    actual = ace.amount_sold("hammer")
    expected = 5

    assert_equal expected, actual
  end

end
