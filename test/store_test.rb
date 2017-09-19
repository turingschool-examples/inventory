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
    inventory3.record_item({"shirt" => {"quantity" => 55, "cost" => 15}})
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

  def test_stock_check_returns_item_information_from_the_latest_inventory_that_contains_given_item
    actual = @acme.stock_check("shirt")
    expected = {"quantity" => 55, "cost" => 15}

    assert_equal expected, actual
  end

  def test_find_inventories_with_item_returns_array_of_inventories_with_item
    actual = @acme.find_inventories_with_item("shirt")
    expected = [@acme.inventory_record.first, @acme.inventory_record.last]

    assert_equal expected, actual
  end

  def test_sort_by_most_recent_returns_ordered_array_of_most_recent_inventories
    actual = @acme.sort_by_most_recent(@acme.inventory_record)
    expected = [@acme.inventory_record.last, @acme.inventory_record.first]

    assert_equal expected, actual
  end

  def test_amount_sold_returns_the_amount_sold_between_most_recent_two_dates
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

  def test_us_order_calculates_total_of_order_in_us_dollars
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    hobby_town.add_inventory(inventory5)


    actual = hobby_town.us_order({"miniature orc" => 30, "fancy paint brush" => 1})
    expected = "$620"

    assert_equal expected, actual
  end

  def test_us_order_amount_returns_us_numeric_total_of_order
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    hobby_town.add_inventory(inventory5)


    actual = hobby_town.us_order_amount({"miniature orc" => 30, "fancy paint brush" => 1})
    expected = 620

    assert_equal expected, actual
  end

  def test_brazilian_order_calculates_total_of_order_in_brazilian_dollars
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    hobby_town.add_inventory(inventory5)


    actual = hobby_town.brazilian_order({"miniature orc" => 30, "fancy paint brush" => 1})
    expected = "R$1909.60"

    assert_equal expected, actual
  end

end
