require './test/test_helper'

class InventoryTest < Minitest::Test

  attr_reader :inventory

  def setup
    @inventory = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_inventory_exists
    assert_instance_of Inventory, inventory
  end

  def test_inventory_has_a_date
    assert_equal Date.new(2017, 9, 18), inventory.date
  end

  def test_inventory_stores_items_in_empty_hash
    assert_equal ({}), inventory.items
  end

  def test_inventory_can_record_new_item
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    inventory_items = {"shirt" => {"quantity" => 50, "cost" => 15}}

    assert_equal (inventory_items), inventory.items
  end

  def test_inventory_can_record_multiple_new_items
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})
    inventory_items = {"shirt" => {"quantity" => 50, "cost" => 15},
                       "shoes" => {"quantity" => 30, "cost" => 20}
                      }

    assert_equal inventory_items, inventory.items
  end

  def test_check_inventory_returns_nil_for_item_not_in_inventory
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_nil inventory.check_inventory("pants")
  end

  def test_it_can_check_inventory_for_item
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})

    shoes = {"quantity" => 30, "cost" => 20}
    shirt = {"quantity" => 50, "cost" => 15}

    assert_equal (shirt), inventory.check_inventory("shirt")
    assert_equal (shoes), inventory.check_inventory("shoes")
  end

  def test_item_cost_returns_nil_for_item_not_in_inventory
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_nil inventory.item_cost("pants")
  end

  def test_inventory_can_find_item_cost
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})

    assert_equal 15, inventory.item_cost("shirt")
    assert_equal 20, inventory.item_cost("shoes")
  end

end
