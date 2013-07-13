def count_moves(position)
  distances = get_distances_to_bounds(position).select{|d| d < 2}.sort
  case distances
  when [] then 8
  when [1] then 6
  when [1,1], [0] then 4
  when [0,1] then 3
  when [0,0] then 2
  end
end

def get_distances_to_bounds(position)
  x = position[0].ord - 'a'.ord + 1
  y = position[1].to_i
  [x,y].map{|i| calculate_distance_to_bounds i}
end

def calculate_distance_to_bounds(x)
  x > 4 ? 8-x : x-1
end

n = gets.to_i
n.times do
  puts count_moves(gets)
end