class Inventory

  attr_reader :date,
              :items

  def initialize(date)
    @date = date
    @items = {}
  end

  def record_item(item)
    @items.merge!(item){|key, x, y| x + y}

    # a.merge(b) { |k, x, y| x + y }
    # h1.merge(h2){|key, oldval, newval| newval - oldval}
  end

end
