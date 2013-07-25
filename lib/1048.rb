n = gets.to_i
overflow = false

ZERO_ORD = '0'.ord
DIGITS = [ZERO = '0', '1', '2', '3', '4', '5', '6', '7', '8', NINE = '9']
ORD = Hash[DIGITS.map{|d| [d, d.ord - ZERO_ORD]}]

res = ''

$stdin.each_line do |str|
  s = ORD[str[0]] + ORD[str[2]]
  if s < 10
    res << DIGITS[s]
  else
    j = 1
    while j <= res.size && res[-j] == NINE
      res[-j] = ZERO
      j += 1
    end
    overflow ||= j > res.size
    res[-j] = DIGITS[ORD[res[-j]]+1] if j <= res.size
    res << DIGITS[s-10]
  end
end

print '1' if overflow
print res
