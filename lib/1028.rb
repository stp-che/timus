class StarMap
  attr_reader :levels
  def initialize(n)
    @levels = Array.new n, 0
    @columns = []
    @last_column = []
  end

  def add(x, y)
    if @current_y != y
      if @current_y
        @columns << @last_column
        @last_column = []
      end
      @current_y = y
    end
    @levels[get_level(x)] += 1
    @last_column << x
  end

  def get_level(x)
    level = 0
    @columns.each do |column|
      i = column.count{|v| v <= x } 
      i = count_less_or_equal(column, x)
      level += i
    end
    level + @last_column.size
  end

  def count_less_or_equal(list, value)
    return 0 if list.empty? || list[0] > value 
    return list.size if list[-1] <= value
    middle = list.size >> 1
    if list[middle] <= value
      middle + count_less_or_equal(list[middle, list.size], value)
    else
      count_less_or_equal(list[0, middle], value)
    end
  end
end

n = gets.to_i
map = StarMap.new n
n.times do
  map.add *gets.split(' ').map{|i| i.to_i}
end

puts map.levels*"\n"