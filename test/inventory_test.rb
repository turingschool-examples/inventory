require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require 'DATE'

class InventoryTest < Minitest::Test

  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_instance_of_first_inventory
    assert_instance_of Inventory, @inventory1
  end

  def test_inventory_has_a_date
    assert_equal "2017-9-18", @inventory1.date.parse 
  end
end

# inventory1 = Inventory.new(Date.new(2017, 9, 18))
# => <Inventory...>

# inventory1.date 
# => #<Date: 2017-09-18 ((2458015j,0s,0n),+0s,2299161j)>

# inventory1.items 
# => {} 

# inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
# inventory1.items 
# => {"shirt" => {"quantity" => 50, "cost" => 15}}

# inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
# inventory1.items 
# => {"shirt" => {"quantity" => 60, "cost" => 15}}