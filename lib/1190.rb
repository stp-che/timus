COUNT = gets.to_i
WHOLE = 10_000

ok = true
n = 0
rest_lower = rest_upper = WHOLE
last_seen_amount = WHOLE
without_amount_count = 0
while ok && n < COUNT
  _, i, amount = gets.split
  if i == '0'
    without_amount_count += 1
  else
    amount = amount.to_i
    ok = amount <= last_seen_amount
    rest_lower -= last_seen_amount*without_amount_count + amount
    rest_upper -= amount*(without_amount_count+1)
    ok &&= rest_upper >= 0
    last_seen_amount = amount
    without_amount_count = 0
  end
  n += 1
end

rest_lower -= last_seen_amount*without_amount_count
rest_upper -= without_amount_count

ok &&= rest_lower <= 0 && rest_upper >= 0

puts ok ? 'YES' : 'NO'
