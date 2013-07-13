N = gets.to_i

a_first = gets.to_f
a_last = gets.to_f

sum = 0

N.times{|i| sum += (N-i)*gets.to_f }

puts '%0.2f' % ((N*a_first + a_last - 2*sum)/(N+1))

