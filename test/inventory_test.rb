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

end
