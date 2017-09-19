require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test
  attr_reader :inventory

  def setup
    @inventory = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_if_instance_of_a_class_exist
    assert_instance_of Inventory, inventory
  end

  def test_if_date_records_date
    assert_equal Date, inventory.date
  end

  def test_if_items_is_a_hash
    assert_equal {}, repository.items
  end

  def test_if_items_records_the_item

  end


end
