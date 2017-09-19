require 'date'
require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'

class InventoryTest < Minitest::Test

  attr_reader :inventory
  def setup
    @inventory = Inventory.new(Date.new(2017, 9, 18))
  end

  def test_it_has_a_date
    date = Date.new(2017, 9, 18)
    assert_equal date, inventory.date
  end

  def test_it_has_an_items_Hash_that_starts_empty
    assert_equal({}, inventory.items)
  end

  def test_record_item_adds_key_when_empty
    item = { "shirt" => { "quantity" => 1, "cost" => 2 } }
    inventory.record_item(item)
    assert_equal item, inventory.items
  end

  def test_record_item_adds_key_when_other_items_present
    inventory.record_item({ "shirt" => { "quantity" => 1, "cost" => 2 } })
    inventory.record_item({ "pants" => { "quantity" => 2, "cost" => 3 } })
    expected = {
      "shirt" => { "quantity" => 1, "cost" => 2 },
      "pants" => { "quantity" => 2, "cost" => 3 }
    }
    assert_equal expected, inventory.items
  end

  def test_record_item_adds_quantity_when_same_other_present
    inventory.record_item({ "shirt" => { "quantity" => 1, "cost" => 2 } })
    inventory.record_item({ "pants" => { "quantity" => 4, "cost" => 2 } })
    expected = { "shirt" => { "quantity" => 5, "cost" => 2 } }
    assert_equal expected, inventory.items
  end

end
