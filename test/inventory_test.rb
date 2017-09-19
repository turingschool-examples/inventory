require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test

  def setup
    @i = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_it_exists
    assert_instance_of Inventory, @i
  end

  def test_it_can_display_date
    assert_instance_of Date, @i.date
  end

  def test_it_initializes_with_no_items
    assert_equal 0, @i.items.length
  end

  def test_it_can_record_item
    item = {"shirt" => {"quantity" => 50, "cost" => 15}}
    @i.record_item(item)

    assert_equal 1, @i.items.length

    hash = {"shirt" => {"quantity" => 50, "cost" => 15}}

    assert_equal hash, @i.items
  end

  def test_can_tell_if_key_already_here
    item = {"shirt" => {"quantity" => 50, "cost" => 15}}
    @i.record_item(item)

    refute @i.key_already_here?({"shirt" => {"quantity" => 50, "cost" => 15}})
    assert @i.key_already_here?({"pants" => {"quantity" => 50, "cost" => 15}})
  end

  def test_it_can_add_multiple_shirt_quantities
    item1 = {"shirt" => {"quantity" => 50, "cost" => 15}}
    item2 = {"shirt" => {"quantity" => 10, "cost" => 15}}
    @i.record_item(item1)
    @i.record_item(item2)
    assert_equal 60, @i.items['shirt']['quantity']
  end
end
