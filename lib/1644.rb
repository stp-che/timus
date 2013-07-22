HUNGRY = 'hungry'
SATISFIED = 'satisfied'

max_hungry = 2
min_satisfied = 10
n = gets.to_i
n.times do
  amount, result = gets.split
  amount = amount.to_i
  if result == HUNGRY && max_hungry < amount
    max_hungry = amount
  elsif result == SATISFIED && amount < min_satisfied
    min_satisfied = amount
  end
end

puts (max_hungry < min_satisfied) ? min_satisfied : 'Inconsistent'
