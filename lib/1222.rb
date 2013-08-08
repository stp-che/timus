def max(n)
  return n if n < 4
  r = n%3
  r = 4 if r == 1
  q = (n-r)/3
  r = 1 if r == 0
  3**q*r
end

puts max(gets.to_i)