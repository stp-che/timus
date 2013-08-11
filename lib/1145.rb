class Labirynth
  BLOCK = '#'
  EMPTY = '.'

  attr_reader :configuration

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @configuration = []
  end

  def max_path_length1
    cell = catch :empty do
      @rows.times{|i|
        @cols.times{|j| throw :empty, [i,j] if configuration[i][j] == EMPTY }
      }
    end
    d, w = get_depth_and_width(cell)
    d > w ? d : w
  end

  def get_depth_and_width(cell, parent=nil)
    children_results = []
    moves_from *cell do |*move|
      children_results << get_depth_and_width(move, cell) unless move == parent
    end
    if children_results.empty?
      d, w = 0, 0
    elsif children_results.size == 1
      d, w = children_results[0][0]+1, children_results[0][1]
    else
      ds = children_results.map{|a| a[0]}.sort
      d = ds[-1] + 1
      w = [children_results.map{|a| a[1]}.max, ds[-1]+ds[-2]+2].max
    end
    return [d,w]
  end

  def max_path_length
    cell = catch :dead_end do
      @rows.times{|i|
        @cols.times{|j| throw :dead_end, [i,j] if dead_end?(i,j) }
      }
    end
    far_cell, distance = get_far_from(*cell)
    _, distance1 = get_far_from(*far_cell)
    distance > distance1 ? distance : distance1
  end

  def get_far_from(row, col)
    distances = Array.new(@rows) { Array.new(@cols) }
    distances[row][col] = 0
    cells = [[row, col]]
    cell = nil
    d = nil
    until cells.empty?
      cell = cells.shift
      d = distances[cell[0]][cell[1]]
      moves_from *cell do |r,c|
        unless distances[r][c]
          distances[r][c] = d + 1
          cells << [r,c]
        end
      end
    end
    [cell, d]
  end

  SURROUNDINGS = [[-1, 0], [1, 0], [0, -1], [0, 1]]

  def moves_from(row, col, &block)
    SURROUNDINGS.each do |dr, dc|
      yield row+dr, col+dc if configuration[row+dr][col+dc] == EMPTY
    end
  end

  def dead_end?(row, col)
    configuration[row][col] == EMPTY && 
    SURROUNDINGS.count{|dr, dc| configuration[row+dr][col+dc] == EMPTY } == 1
  end

end

cols, rows = gets.split.map(&:to_i)
labirynth = Labirynth.new rows, cols
rows.times{ labirynth.configuration << gets }

puts labirynth.max_path_length
