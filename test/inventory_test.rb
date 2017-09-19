require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test

  def test_it_exists
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Inventory, inventory1
  end

  def test_it_has_a_date
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Date, inventory1.date
  end

  def test_it_starts_with_empty_items
    inventory1 = Inventory.new(Date.new(2017, 9, 18))

    assert_instance_of Hash, inventory1.items
    assert inventory1.items.empty?
  end

  def test_it_can_record_items
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.items

    assert_includes ["quantity" => 50, "cost" => 15], inventory1.items['shirt']
    assert_equal "shirt", inventory1.items.keys.first
    assert_equal 50, inventory1.items['shirt']['quantity']
    assert_equal 15, inventory1.items['shirt']['cost']
  end

  def test_it_can_record_multiple_items_that_have_the_same_name
    inventory1 = Inventory.new(Date.new(2017, 9, 18))
    inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
    inventory1.items

    assert_equal "shirt", inventory1.items.keys.first
    assert_equal 60, inventory1.items['shirt']['quantity']
    assert_equal 15, inventory1.items['shirt']['cost']
  end

  def test_it_can_have_multiple_items_with_different_items
    #failing test....
    inventory4 = Inventory.new(Date.new(2017, 9, 18))
    inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
    inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

    expected = {"mitre saw" => {"quantity" => 10, "cost" => 409}},{"hammer" => {"quantity" => 15, "cost" => 20}}
    actual = inventory4.items
    assert_equal expected, actual
  end

end
