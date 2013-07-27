# coding: utf-8

# граница, в которую гарантированно попадёт результат, 
# соответственно числа большие этого значения можно не запоминать
MAX_BOUND = 2*10**5

# массив для хранения уже встретившихся чисел
$marked = []

$result = 1

ZERO_ORD = '0'.ord

def receive(n)
  return if $marked[n]
  if n >= $result && n < MAX_BOUND
    $marked[n] = true
  end
  $result += 1 while $marked[$result]
end

current = Array.new 6, 0
$stdin.read.bytes do |b|
  d = b - ZERO_ORD
  receive d
  (1..5).each{|i|
    current[-i] = current[-i-1]==0 ? 0 : current[-i-1]*10 + d
    receive current[-i]
  }
  current[0] = d
end

print $result