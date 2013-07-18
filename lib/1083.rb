n,k = gets.split
n = n.to_i
k = k.size
m = 1
while n > k
  m *= n
  n -= k
end
m *= n if n > 1
puts m