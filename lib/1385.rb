n = gets.to_i
puts case n
when 1 then 14
when 2 then 155
else
  1575*10**(n-3)
end
