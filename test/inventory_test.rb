require './test/test_helper'

class InventoryTest < Minitest::Test

  attr_reader :inventory1

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_inventory_exists
    assert_instance_of Inventory, inventory1
  end

  def test_inventory_has_a_date
    assert_equal Date.new(2017, 9, 18), inventory1.date
  end

  def test_inventory_stores_items_in_empty_hash
    assert_equal ({}), inventory1.items
  end

  def test_inventory_can_record_new_item
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    inventory1_items = {"shirt" => {"quantity" => 50, "cost" => 15}}

    assert_equal (inventory1_items), inventory1.items
  end

  def test_inventory_can_record_multiple_new_items
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})
    inventory_items = {"shirt" => {"quantity" => 50, "cost" => 15},
                       "shoes" => {"quantity" => 30, "cost" => 20}
                      }

    assert_equal inventory_items, inventory1.items
  end

  def test_check_inventory_returns_nil_for_item_not_in_inventory
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_nil inventory1.check_inventory("pants")
  end

  def test_it_can_check_inventory_for_item
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})

    shoes = {"quantity" => 30, "cost" => 20}
    shirt = {"quantity" => 50, "cost" => 15}

    assert_equal (shirt), inventory1.check_inventory("shirt")
    assert_equal (shoes), inventory1.check_inventory("shoes")
  end

  def test_item_cost_returns_nil_for_item_not_in_inventory
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_nil inventory1.item_cost("pants")
  end

  def test_inventory_can_find_item_cost
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shoes" => {"quantity" => 30, "cost" => 20}})

    assert_equal 15, inventory1.item_cost("shirt")
    assert_equal 20, inventory1.item_cost("shoes")
  end

end
