n, k = gets.split.map(&:to_i)
sum = 0
$stdin.read.each_line do |line|
  line_data = line.split
  line_sum = 0
  line_sum_squares = 0
  i = 3
  while i < line_data.size
    x = line_data[i].to_i
    line_sum += x
    line_sum_squares += x**2
    i += 2
  end
  sum += (line_sum**2 - line_sum_squares)/2
end

puts sum