# coding: utf-8

UPPER_BOUND = 10**9
$points = [0, 1, [UPPER_BOUND]] # [point, color, *next([point, color. *next])]

def paint(x, y, color)
  p = $points
  prev = nil
  while p[2][0] <= x
    prev = p
    p = p[2]
  end

  # seg_x = p
  # seg_x_prev = prev

  # p = p[2] while p[2][0] <= y
  # seg_y = p

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