data = $stdin.read.split("\n").map{|l| l.to_i}

N = data[0]
CHECK_LIST = data[1..N]

$count = 0

def check(value, from=0, to=N-1)
  return false if value > CHECK_LIST[to] || value < CHECK_LIST[from]
  return true if value == CHECK_LIST[from]
  m = (from+to)/2
  value > CHECK_LIST[m] ? check(value, m+1, to) : check(value, from, m)
end

M = data[N+1]
i = N+2
M.times{ 
  $count += 1 if check(data[i])
  i += 1
}

puts $count