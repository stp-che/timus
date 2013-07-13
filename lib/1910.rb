n = gets.to_i
sections = gets.split(' ').map{|s| s.to_i}

max_power = 0
found_section = nil

power = sections[0,3].inject(&:+)
current_section = 1

while current_section < n-1 do
  if max_power < power
    max_power = power
    found_section = current_section
  end
  current_section += 1
  power += sections[current_section+1] - sections[current_section-2] if current_section < n-1
end

puts "#{max_power} #{found_section+1}"
