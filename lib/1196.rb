DATA = $stdin.read.split("\n").map(&:to_i)

N = DATA[0]

$count = 0

def check(value, from=1, to=N)
  return false if value > DATA[to] || value < DATA[from]
  return true if value == DATA[from]
  m = (from+to)/2
  value > DATA[m] ? check(value, m+1, to) : check(value, from, m)
end

M = DATA[N+1]
i = N+2
M.times{ 
  $count += 1 if check(DATA[i])
  i += 1
}

puts $count