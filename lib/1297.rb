str = gets

max_palindrom_start = max_palindrom_end = 0

max_index = str.size-1
i=0
while i <= max_index
  m_start = i
  m_end = m_start
  m_end += 1 while str[m_end+1] == str[m_start]
  j = 0
  j += 1 while j < m_start && m_end+j < max_index && str[m_start-j-1] == str[m_end+j+1]
  if max_palindrom_end - max_palindrom_start < m_end+j-m_start+j
    max_palindrom_start = m_start-j
    max_palindrom_end = m_end+j
  end
  i = m_end+1
end

puts str[max_palindrom_start..max_palindrom_end]