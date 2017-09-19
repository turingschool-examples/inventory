require "minitest/autorun"
require "minitest/pride"
require 'date'
require './lib/inventory'

class InventoryTest < Minitest::Test

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_inventory_class_exists
    assert_instance_of Inventory, @inventory1
  end

  def test_inventory_has_a_date_that_is_an_instance_of_the_date_class
    assert_instance_of Date, @inventory1.date
  end

  def test_inventory_has_an_items_hash_that_is_defaulted_to_empty
    assert_empty @inventory1.items
  end

  def test_record_item_adds_item_information_to_items_hash
    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    assert_equal ({"shirt"=>{"quantity"=>50, "cost"=>15}}), @inventory1.items
  end

  def test_record_item_will_add_quantity_and_cost_to_previously_added_item
    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    assert_equal ({"shirt"=>{"quantity"=>50, "cost"=>15}}), @inventory1.items

    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    assert_equal ({"shirt"=>{"quantity"=>100, "cost"=>15}}), @inventory1.items
  end

  def test_update_item_quantity_updates_quantity_of_item_given_item_name
    @inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    assert_equal ({"shirt"=>{"quantity"=>50, "cost"=>15}}), @inventory1.items

    @inventory1.update_item_quantity("shirt", {"quantity" => 50, "cost" => 15})
    assert_equal ({"shirt"=>{"quantity"=>100, "cost"=>15}}), @inventory1.items
  end

end
