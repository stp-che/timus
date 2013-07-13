class Labyrinth
  EMPTY_CELL = '.'
  BLOCK = '#'
  CELL_SIZE = 3
  CELL_HEIGHT = 3

  def initialize(size, configuration)
    @size = size
    @configuration = configuration
  end

  def visible_walls_square
    visible_walls_count*CELL_SIZE*CELL_HEIGHT
  end

  def visible_walls_count
    @visible_walls_count ||= begin
      res = 0
      walk{|x,y| res += count_walls_for_cell(x,y) }
      res
    end    
  end

  def count_walls_for_cell(x,y)
    adjacent_positions(x,y).count{|c| cell(*c) == BLOCK}
  end

  def cell(x, y)
    if x < 0 && y > 0 || y < 0 && x > 0 || x >= @size && y < @size-1 || y >= @size && x < @size-1
      BLOCK
    elsif x >=0 && y >=0 && x < @size && y < @size
      @configuration[y*@size+x]
    end
  end

  def walk(start_x=0, start_y=0, &block)
    marked = Array.new @configuration.size
    cells = [[start_x, start_y]]
    marked[start_y*@size+start_x] = true
    until cells.empty?
      new_cells = []
      cells.each do |x,y|
        yield x, y
        adjacent_positions(x,y).each{|c| 
          if !marked[c[1]*@size+c[0]] && cell(*c) == EMPTY_CELL
            new_cells << c
            marked[c[1]*@size+c[0]] = true
          end
        }
      end
      if new_cells.empty? && !marked[-1] # start from the right-bottom if we couldn't get there from top-left
        new_cells << [@size-1, @size-1] 
        marked[-1] = true
      end
      cells = new_cells
    end
  end

  private

  def adjacent_positions(x,y)
    [ [x, y-1], [x-1, y], [x, y+1], [x+1, y] ]
  end

end

n = gets.to_i
str = ''
n.times{ str << gets.strip }

labyrinth = Labyrinth.new n, str
puts labyrinth.visible_walls_square

