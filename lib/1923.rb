class Map

  attr_reader :rows, :cols, :configuration

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @empires = [[@rows-1, 0], [0, @cols-1]]
    @configuration = []
  end

  def action(empire, union)
    country_walk @empires[empire] do |row, col|
      configuration[row][col] = union
    end
  end

  def empire_size(empire)
    size = 0
    country_walk @empires[empire] do |row, col|
      size += 1
    end
    size
  end

  private

  def country_walk(start, &block)
    marked = Array.new(rows){ Array.new(cols) }
    union = configuration[start[0]][start[1]]
    cells = [start]
    marked[start[0]][start[1]] = true
    until cells.empty?
      cell = cells.shift
      yield cell if block_given?
      surroundings(cell){|c| 
        if configuration[c[0]][c[1]] == union && !marked[c[0]][c[1]]
          cells << c 
          marked[c[0]][c[1]] = true
        end
      }
    end
  end

  def surroundings(c, &block)
    yield [c[0]-1, c[1]] if c[0] > 0
    yield [c[0]+1, c[1]] if c[0] < rows - 1
    yield [c[0], c[1]-1] if c[1] > 0
    yield [c[0], c[1]+1] if c[1] < cols - 1
  end

end

map = Map.new *(gets.split.map(&:to_i))
map.rows.times{ map.configuration << gets }
actions_count = gets.to_i
gets.strip.split.each_with_index{|a, i| map.action i&1, a }
# map.configuration.each{|r| puts r}
puts map.empire_size(0)
puts map.empire_size(1)