require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'date'

class InventoryTest < Minitest::Test
  attr_reader :inventory1
  
  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_exists
    assert_instance_of Inventory, inventory1
  end

  def test_inventory_records_date
    assert_instance_of Date, inventory1.date
  end

  def test_inventory_starts_with_no_items 
    assert_equal ({}), inventory1.items    
  end

  def test_inventory_can_record_item
    assert_equal ({}), inventory1.items   

    arg = {"shirt" => {"quantity" => 50, "cost" => 15}} 
    inventory1.record_item(arg)   
     
    assert_equal arg, inventory1.items
  end

  def test_inventory_can_record_many_items
    assert_equal ({}), inventory1.items   

    arg = {"shirt" => {"quantity" => 50, "cost" => 15}} 
    inventory1.record_item(arg)   
     
    assert_equal arg, inventory1.items

    other_arg = {"shirt" => {"quantity" => 10, "cost" => 15}}
    inventory1.record_item(other_arg)
    expected  = {"shirt" => {"quantity" => 60, "cost" => 15}}

    assert_equal expected, inventory1.items
  end
end