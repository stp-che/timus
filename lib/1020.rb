n, r = gets.split
n = n.to_i
r = r.to_f
$a = []
n.times{ $a << gets.split.map(&:to_f) }

def X(i)
  $a[i][0] - $a[i-1][0]
end

def Y(i)
  $a[i][1] - $a[i-1][1]
end

sum = 2*r*Math::PI
if n > 1
  sum += (-1..n-2).inject(0){|s, i| s + Math.sqrt( X(i)**2 + Y(i)**2 ) }
end

puts sum.round(2).to_s