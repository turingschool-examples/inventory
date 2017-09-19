require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test
  attr_reader :inventory

  def setup
    @inventory = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_if_instance_of_a_class_exist
    assert_instance_of Inventory, inventory
  end

  def test_if_date_records_date
    assert_equal Date, inventory.date.class
  end

  def test_if_items_is_a_hash
    assert_equal ({}), inventory.items
  end

  def test_if_items_records_the_item
    inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), inventory.items
  end

  def test_if_record_item_is_dynamic
    inventory.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

    assert_equal ({"shirt" => {"quantity" => 10, "cost" => 15}}), inventory.items
  end


end
