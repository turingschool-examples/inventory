require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'DATE'

class InventoryTest < Minitest::Test

    def setup
      @inventory = Inventory.new(Date.new(2017, 9, 18))
      @inventory2 = Inventory.new(Date.new(2017, 9, 18))
    end

    def test_instance_of_inventory
      assert_instance_of Inventory, @inventory
    end

    def test_date_returns_correct_date
      assert_equal Date, @inventory.date.class
    end

    def test_inventory_begins_with_an_empty_hash
      empty = {}
      assert_equal empty, @inventory.items
    end

    def test_record_items_records_items
      @inventory.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
      @inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

      assert_equal ({"shirt" => {"quantity" => 50, "cost" => 15}}), @inventory.items
      assert_equal ({"shoes" => {"quantity" => 40, "cost" => 30}}), @inventory2.items
    end

    def test_record_items_can_be_added_onto
      skip
      @inventory.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})

      assert_equal ({"shirt" => {"quantity" => 60, "cost" => 15}}), @inventory.items
    end

end












