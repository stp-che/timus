def min(n)
  $cache[n] ||= begin
    r = Math.sqrt(n).to_i
    min = n
    i = (r+1)/2
    while i <= r && min > 1
      m = min(n-$squares[i-1]) 
      min = m if m < min
      i += 1
    end
    min + 1
  end
end

N = gets.to_i
$cache = Array.new N

$squares = (1..Math.sqrt(N).to_i).map{|i| i**2 }
$squares.each{|i| 
  $cache[i] = 1
}

puts min(N)