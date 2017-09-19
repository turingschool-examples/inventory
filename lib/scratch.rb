
  def record_item(item_qty_cost)

  key = item_qty_cost.keys[0]  #good
  value = item_qty_cost.values[0]  #good
  items = {key => value} #good

  inner_key = value.keys[0]  #"quantitiy"
  inner_value = value.values[0] #50
  value = {inner_key => inner_value} # {"quantity"=>50}
  inner_key = value.keys[1] #cost
  inner_value = value.values[1] #15
  value = value + {inner_key => inner_value} # {"cost"=>15}

  items[key] = value
  items[key][inner_key] = inner_value

  end
