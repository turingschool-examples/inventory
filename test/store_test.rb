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
    inventory = Inventory.new(Date.new(2017, 9, 18))

    assert store.inventory_record.empty?

    store.add_inventory(inventory)

    refute store.inventory_record.empty?
    assert_equal inventory, store.inventory_record[-1]
  end

  def test_store_can_have_nventory
    acme = Store.new("Acme", "324 Main St", "Grocery")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})
    
    assert_equal ([]), acme.inventory_record 

    acme.add_inventory(inventory1)
    acme.add_inventory(inventory2)

    assert_equal 2, acme.inventory_record.length
  end

  def test_store_can_check_stock 
    acme = Store.new("Acme", "324 Main St", "Grocery")
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory2 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 60, "cost" => 15}})
    
    inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})
    
    assert_equal ([]), acme.inventory_record 

    acme.add_inventory(inventory1)
    acme.add_inventory(inventory2)
    
    assert_equal ({"quantity" => 60, "cost" => 15}),acme.stock_check("shirt").first
  end

  def test_store_can_determine_sold_count
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

  def test_international_sales
    ace = Store.new("Ace", "834 2nd St", "Hardware")    
    hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
    inventory5 = Inventory.new(Date.new(2017, 3, 10))
    inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
    inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})
    
    ace.add_inventory(inventory5) 
    
    
    order = ace.print_us_order({"miniature orc" => 30, "fancy paint brush" => 1})
    assert_equal "$620", order

    br_order =  ace.brazilian_order({"miniature orc" => 30, "fancy paint brush" => 1})
    assert_equal "R$1909.60", br_order
  end
end