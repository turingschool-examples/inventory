require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
    @inventory2 = Inventory.new(Date.new(2017, 9, 18))
  end


  def test_it_exists
    assert_instance_of Inventory, @inventory1
  end

  def test_date_returns_date_object
    assert_instance_of Date, @inventory1.date
  end

  def test_items_starts_as_empty_hash
    inventory = Inventory.new(Date.new(2017, 9, 18))
    assert_equal ({}), inventory.items
  end

  def test_it_can_record_items_and_store_in_items_hash
    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), @inventory1.items
  end

  def test_it_can_merge_item_quantities
    old_values = {"quantity" => 50, "cost" => 15}
    new_values = {"quantity" => 10, "cost" => 15}

    assert_equal ({"quantity" => 60}), @inventory1.merge_item_quantities(old_values, new_values)
  end

  def test_it_can_retrieve_item_cost
    new_values = {"quantity" => 10, "cost" => 15}

    assert_equal ({"cost" => 15}), @inventory1.item_cost(new_values)
  end

  def test_it_can_record_more_items
    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    @inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 60, "cost" => 15}}), @inventory1.items
  end

  def test_it_knows_if_item_is_in_inventory
    @inventory1.record_item({"shirt" => {"quantity" => 60, "cost" => 15}})
    @inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

    refute @inventory1.item_is_in_inventory?('shoes')
    assert @inventory2.item_is_in_inventory?('shoes')
  end

  def test_it_can_retrieve_quantity_of_item
    @inventory1.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

    assert_equal 20, @inventory1.retrieve_quantity('hammer')
  end

  def test_it_can_retrieve_multiple_item_costs
    @inventory1.record_item({"shirt" => {"quantity" => 60, "cost" => 15}})
    @inventory1.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

    assert_equal [15, 30], @inventory1.retrieve_multiple_item_costs(['shirt', 'shoes'])
  end


end
