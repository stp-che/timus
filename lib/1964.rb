N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
s = A[0]
i = 1
while s > 0 && i < K
  s += A[i] - N
  i += 1
end

puts(s > 0 ? s : 0)