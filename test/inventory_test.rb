require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require "date"

class InventoryTest < Minitest::Test
  attr_reader :inventory1
  def setup
    @inventory1 = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_it_exists
    assert_instance_of Inventory, inventory1
  end

  def test_it_has_a_date
    assert_instance_of Date, inventory1.date
  end

def test_it_can_take_items
  assert inventory1.items.empty?
end

def test_it_can_record_items
  expected = inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
  actual = {"shirt" => {"quantity" => 50, "cost" => 15}}
  assert_equal expected, actual
end

def test_it_can_take_multiple_items
  assert_equal ?, inventory1.items
end

end
