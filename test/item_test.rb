require "minitest/autorun"
require "minitest/pride"
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists
    item = Item.new({"shirt" => {"quantity" => 50, "cost" => 15}})

    assert_instance_of Item, item
    assert_equal 'shirt', item.name
    assert_equal 50, item.quantity
    assert_equal 15, item.cost
  end



end
