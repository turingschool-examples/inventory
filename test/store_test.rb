require "minitest/autorun"
require "minitest/pride"
require "date"
require "./lib/store"
require "./lib/inventory"

class StoreTest < Minitest::Test

  def test_store_exists
    store = Store.new("Hobby Town", "894 Bee St", "Hobby")

    assert_instance_of Store, store
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

  def test_store_can_check_stock
    store = Store.new("Ace", "834 2nd St", "Hardware")
    inventory = Inventory.new(Date.new(2017, 9, 18))
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    store.add_inventory(inventory)

    assert_equal [{"quantity" => 50, "cost" => 15}], store.stock_check("shirt")
  end

  def test_more_than_one_stock
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
    inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

    ace.add_inventory(inventory3)
    ace.add_inventory(inventory4)

    assert_equal [{"quantity" => 20, "cost" => 20}, {"quantity" => 15, "cost" => 20}], ace.stock_check('hammer')
  end

  def test_quantities_returns_all_inventory_quantities
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
    inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

    ace.add_inventory(inventory3)
    ace.add_inventory(inventory4)

    assert_equal [20, 15], ace.quantities("hammer")
  end

  def test_stores_sells_nothing_if_item_does_not_exist
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    ace.add_inventory(inventory3)

    assert_equal 0, ace.amount_sold("kittens")
  end

  def test_store_sells_nothing_if_inventory_does_not_change
    ace = Store.new("Ace", "834 2nd St", "Hardware")

    inventory3 = Inventory.new(Date.new(2017, 9, 16))
    inventory3.record_item({"mitre saw" => {"quantity" => 10, "cost" => 20}})

    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})

    ace.add_inventory(inventory4)

    assert_equal 0, ace.amount_sold("mitre saw")
  end

  def test_store_can_find_amount_sold
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

  def test_store_can_find_cost_of_item
    store = Store.new("Ace", "834 2nd St", "Hardware")
    inventory = Inventory.new(Date.new(2017, 9, 18))
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    store.add_inventory(inventory)

    assert_equal 15, store.find_cost("shirt")
  end

  def test_store_can_calculate_us_price
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    hobby_town.add_inventory(inventory5)

    assert_equal 620, hobby_town.us_order_num({"miniature orc" => 30, "fancy paint brush" => 1})
    assert_equal '$620', hobby_town.us_order({"miniature orc" => 30, "fancy paint brush" => 1})
  end

  def test_store_can_calculate_brazillian_order
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    hobby_town.add_inventory(inventory5)

    assert_equal 1909.60, hobby_town.brazilian_order_num({"miniature orc" => 30, "fancy paint brush" => 1})
    assert_equal 'R$1909.60', hobby_town.brazilian_order({"miniature orc" => 30, "fancy paint brush" => 1})
  end

end
