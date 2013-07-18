n = gets.to_i
k = gets.to_i - 1
a = 1
b = k
(n-1).times{ a, b = b, k*(a+b) }
puts b