# coding: utf-8

=begin
module Tree
  def Tree.create(*args)
    Node.new *args
  end

  class Node
    attr_reader :a, :b, :color, :depth
    attr_accessor :parent, :left, :right

    def initialize(a, b, color)
      @a, @b, @color = a, b, color
      @depth = 1
      @@root ||= self
    end

    def pretty_print(lvl=0)
      pad = '  '*lvl
      "- <[#{@a},#{ @b}] #{@color} (d: #{@depth})>\n"+
      "#{pad}  LEFT\n"+
      "#{pad}    #{@left && @left.pretty_print(lvl+1) || '-'}\n"+
      "#{pad}  RIGHT\n"+
      "#{pad}    #{@right && @right.pretty_print(lvl+1) || '-'}\n"
    end

    def insert(a, b, color)
      ld_inc = rd_inc = false
      if b <= @a
        insert_to_left_branch a, b, color
      elsif a >= @b
        insert_to_right_branch a, b, color
      elsif a < @a && b < @b
        if color == @color
          insert_to_left_branch a, @a, color
        else
          insert_to_left_branch a, b, color
          @a = b
        end
      elsif @a < a && @b < b
        if color == @color
          insert_to_right_branch @b, b, color
        else
          insert_to_right_branch a, b, color
          @b = a
        end
      elsif a <= @a && @b <= b
        @color = color
        insert_to_left_branch a, @a, color if a != @a
        insert_to_right_branch @b, b, color if b != @b
      elsif @a <= a && b <= @b && color != @color
        insert_to_left_branch @a, a, @color if a != @a
        insert_to_right_branch b, @b, @color if b != @b
        @a = a
        @b = b
        @color = color
      end
      if disbalanced?
        rebalance
      else
        update_depth
      end
    end

    def find_longest(color)
      _, _, res = get_longest_and_edges color
      res
    end

    def disbalanced?
      (left_depth - right_depth).abs == 2
    end

    def left_depth
      @left && @left.depth || 0
    end

    def right_depth
      @right && @right.depth || 0
    end

    def root?
      self == @@root
    end

    def root
      @@root
    end

    protected

    def replace_child(child_node, node)
      if @right == child_node
        append_to_right node
      elsif @left == child_node
        append_to_left node
      else
        # raise ChildNotFound
      end
    end

    def append_to_left(node)
      @left = node
      node.parent = self if node
    end

    def append_to_right(node)
      @right = node
      node.parent = self if node
    end

    def update_depth
      @depth = (left_depth > right_depth ? left_depth : right_depth) + 1
    end

    def replace(node)
      unless root?
        @parent.replace_child(self, node)
      else
        node.parent = nil  
        @@root = node
      end
    end

    def get_longest_and_edges(color)
      left_edges, left_len, left_max = @left && @left.get_longest_and_edges(color) || [[0,0], 0, nil]
      right_edges, right_len, right_max = @right && @right.get_longest_and_edges(color) || [[0,0], 0, nil]

      left_whole = left_edges[0] == left_len
      right_whole = right_edges[0] == right_len

      middle_segment = nil
      my_len = @b - @a
      my_left_edge = left_edges[0]
      my_right_edge = right_edges[1]

      if @color == color
        middle_segment = [@a - left_edges[1], @b + right_edges[0]]
        my_left_edge += my_len + right_edges[0] if left_whole
        my_right_edge += my_len + left_edges[1] if right_whole
      end

      my_max = find_max_range left_max, middle_segment, right_max

      [[my_left_edge, my_right_edge], left_len + my_len + right_len, my_max]
    end

    private

    def find_max_range(*ranges)
      max = nil
      max_len = 0
      ranges.each do |r|
        next unless r
        r_len = r[1]-r[0]
        if r_len > max_len || r_len == max_len && r[0] < max[0]
          max = r
          max_len = r_len
        end
      end
      max
    end

    def insert_to_left_branch(*args)
      if @left
        @left.insert *args
      else
        append_to_left Node.new(*args)
        @right.nil?
      end
    end

    def insert_to_right_branch(*args)
      if @right
        @right.insert *args
      else
        append_to_right Node.new(*args)
        @left.nil?
      end
    end

    def rebalance
      if left_depth < right_depth
        rotate_left
      else
        rotate_right
      end
    end

    def rotate_left
      a = self
      b = @right
      if b.left_depth <= b.right_depth
        a.append_to_right(b.left)
        a.replace(b)
        b.append_to_left(a)
        a.update_depth
        b.update_depth
      else
        c = b.left
        a.append_to_right(c.left)
        b.append_to_left(c.right)
        c.append_to_right(b)
        a.replace(c)
        c.append_to_left(a)
        b.update_depth
        a.update_depth
        c.update_depth
      end
    end

    def rotate_right
      a = self
      b = @left
      if b.right_depth <= b.left_depth
        a.append_to_left(b.right)
        a.replace(b)
        b.append_to_right(a)
        a.update_depth
        b.update_depth
      else
        c = b.right
        a.append_to_left(c.right)
        b.append_to_right(c.left)
        c.append_to_left(b)
        a.replace(c)
        c.append_to_right(a)
        b.update_depth
        a.update_depth
        c.update_depth
      end
    end

  end

end

WHITE = 'w'
BLACK = 'b'
N = 1000_000_000

$tree = Tree.create 0, N, WHITE

gets.to_i.times do
  a, b, color = gets.split
  $tree.root.insert a.to_i, b.to_i, color
end

r = $tree.root.find_longest WHITE

puts "#{r[0]} #{r[1]}"

=end


UPPER_BOUND = 10**9
$points = [0, 1, [UPPER_BOUND]] 

def paint(x, y, color)
  p = $points
  prev = nil
  while p[2][0] <= x
    prev = p
    p = p[2]
  end

  if x == p[0] && prev.nil?
    left = p
  elsif x == p[0] && prev[1] == color
    left = prev
  elsif p[1] == color
    left = p
  else
    left = [x, color, p[2]]
    p[2] = left
  end

  if y < left[2][0]
    left[2] = [y, p[1], left[2]]
  end
  
  p = left
  p = p[2] while y >= p[2][0]
  if p[1] == color
    right = p[2]
  elsif
    p[0] = y
    right = p
  end

  left[1] = color
  left[2] = right
end

n = gets.to_i
n.times do |i|
  data = gets.split ' '
  paint data[0].to_i, data[1].to_i, (data[2] == 'w' ? 1 : 0)
end

longest_white = nil
length = 0
p = $points
while p[2]
  if p[1] == 1 && p[2][0] - p[0] > length
    longest_white = p
    length = p[2][0] - p[0]
  end
  p = p[2]
end

puts "#{longest_white[0]} #{longest_white[2][0]}"

