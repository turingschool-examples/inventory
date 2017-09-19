class Inventory

attr_reader :date

def initialize(date)
  @date = date
end

def date
  Time.new(@date.year, @date.month, @date.day)
end


end
