def digit(position)
  d = (position-1)*2
  n = Math.sqrt(d).to_i
  d == n*(n+1) ? 1 : 0
end

n = gets.to_i
n.times{|i| 
  print digit(gets.to_i) 
  print ' ' unless i==n-1
}
