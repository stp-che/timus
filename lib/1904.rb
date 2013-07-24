n = gets.to_i
A = gets.split.map(&:to_i)

def solve(a, ranges)
  res = []
  ranges.each do |l,r|
    l = 0 if l < 0
    if r >= 0
      res += [[a-r, a-l], [a+l, a+r]]
    end
  end
  res1 = []
  res.sort_by{|r| r[0]}.each do |l,r|
    if res1.last && res1.last[1] >= l
      res1.last[1] = r
    else
      res1 << [l,r]
    end
  end
  res1
end

ranges = [[0,1]]
n.times.each do |i|
  ranges = solve A[-1-i], ranges
end

puts ranges.size
ranges.each{|l,r| puts "#{l} #{r}"}