require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test
  attr_reader :inv

  def setup
    @inv = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_it_exists
    assert_instance_of Inventory, inv
  end

  def test_it_holds_a_date
    assert_instance_of Date, inv.date
  end

  def test_items_initializes_as_an_empty_hash
    assert inv.items.empty?
  end

  def test_it_can_record_an_item_and_it_will_appear_in_items
    inv.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal 1, inv.items.count
  end

  def test_it_can_record_a_second_item
    inv.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inv.record_item({"pants" => {"quantity" => 50, "cost" => 15}})

    assert_equal 2, inv.items.count
  end

  def test_it_can_add_quantities_and_costs
    inv.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
    inv.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_equal 100, inv.items["shirt"]["quantity"]
    assert_equal 30, inv.items["shirt"]["cost"]
  end

end
