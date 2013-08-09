# Алгоритм такой.
# Пусть T(a,b) - время доставки сообщения от a к b.
# Тогда 
# 1) T(a,a) = 0
# 2) T(a,b) = T(b,a)
# 3) T(1, 2^n) = 2^n-n-1
# 4) T(2^n-1, 2^n) = T(2^n, 2^n+1) = n-1
# 5) a <= b --> T(a,b) = T(1,b) - T(1,a)
#
# Пусть a < b и числа m и n такие, что 2^m <= a < 2^(m+1) и 2^n <= b < 2^(n+1)
# Тогда T(a,b) = T(1, 2^(n+1)) - T(1, 2^(n+1)-b) - T(2^(n+1)-1, 2^(n+1)) - 
#                ( T(1, 2^(m+1)) - T(1, 2^(m+1)-a) - T(2^(m+1)-1, 2^(m+1)) )

def delivery_time(from, to)
  return 0 if from == to
  from, to = to, from if from > to
  m = 0
  vm = 1
  while vm <= from
    m += 1
    vm <<= 1
  end
  n = m
  vn = vm
  while vn <= to
    n += 1
    vn <<= 1
  end
  return to - n if from == 1 && vn == 2*to
  vn - 2*n - vm + 2*m - delivery_time(1, vn-to) + delivery_time(1, vm-from)
end

puts delivery_time(*gets.split.map(&:to_i))