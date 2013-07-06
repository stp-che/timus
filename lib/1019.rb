# coding: utf-8

$points = [1, 1, [10**9]] # [pint, color, *next([point, color. *next])]

def paint(x, y, color)
  p = $points
  prev = nil
  while p[2][0] <= x
    prev = p
    p = p[2]
  end
  if x == p[0] && prev.nil?
    p[1] = color
    left = p
  elsif x == p[0] && prev[1] == color
    left = prev
  elsif p[1] == color
    left = p
  else
    left = [x, color, p[2]]
    p[2] = left
  end
  
  p = left
  p = p[2] while y >= p[2][0]
  if p[1] == color
    right = p[2]
  elsif #TODO: это неверно, если x и y попадут в один отрезок
    p[0] = y
    right = p
  end

  left[2] = right
end

n = gets.to_i
n.times do |i|
  data = gets.split ' '
  paint data[0].to_i, data[1].to_i, (data[2] == 'w' ? 1 : 0)
end
