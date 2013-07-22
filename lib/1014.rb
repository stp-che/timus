n = gets.to_i
res = case n
when 0 then '10'
when 1 then '1'
else
  digits = Array.new(10, 0)
  i = 9
  while n > 1 && i > 1
    while n%i == 0
      n = n/i
      digits[i] += 1
    end
    i -= 1
  end
  if n > 1
    '-1'
  else
    str = ''
    digits.each_with_index{|power,d| str << d.to_s*power if power > 0 }
    str
  end
end

puts res