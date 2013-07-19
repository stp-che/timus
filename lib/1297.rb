str = gets
max_palindrom_start = max_palindrom_end = 0
current_palindrom_start = 0
current_palindrom_has_different_letters = false

(1..str.size-1).each do |i|
  x = str[i]
  if !current_palindrom_has_different_letters && x == str[i-1]
    # do nothing
  elsif current_palindrom_start > 0 && x == str[current_palindrom_start-1]
    current_palindrom_start -= 1
    current_palindrom_has_different_letters = true
  else
    current_palindrom_start = i
    current_palindrom_has_different_letters = false
  end
  if i - current_palindrom_start > max_palindrom_end - max_palindrom_start
    max_palindrom_start = current_palindrom_start
    max_palindrom_end = i
  end
end

puts str[max_palindrom_start..max_palindrom_end]