n = gets.to_i
groups = gets.split(' ').map(&:to_i)
k = n >> 1
puts ((groups.sort[0..k].inject(&:+) + k + 1) >> 1)
