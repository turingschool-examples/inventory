require "minitest/autorun"
require "minitest/pride"
require './lib/inventory'
require './lib/date'


class DateTest < Minitest::Test

  def test_it_exists
    date = Date.new(2017, 9, 18)

    assert_instance_of Date, date
  end

  def test_it_has_a_year
    date = Date.new(2017, 9, 18)

    assert_equal 2017, date.year
  end

  def test_it_has_a_month
    date = Date.new(2017, 9, 18)

    assert_equal 9, date.month
  end

  def test_it_has_a_day
    date = Date.new(2017, 9, 18)

    assert_equal 18, date.day
  end





end
