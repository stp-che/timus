N = gets.to_i
$diff = Array.new(N){ 0 }

def add(from, to, amount)
  $diff[from-1] += amount
  $diff[to] -= amount if to < N
end

(N+1).times{
  add *gets.split.map(&:to_i)
}

(1..N-1).each do |i|
  $diff[i] += $diff[i-1]
end

puts $diff.join(' ')