$stdin.binmode

n = $stdin.gets
ROW_LEN = 3 + n.size - n.strip.size

n = n.to_i

TEN = 10
NINE = 9
ZERO_ORD = '0'.ord
DIGITS = [ZERO_CHR = '0', '1', '2', '3', '4', '5', '6', '7', '8', NINE_CHR = '9']
ORD = Hash[DIGITS.map{|d| [d, d.ord - ZERO_ORD]}]

result_buffer = ''
last_below_nine = nil
nines_seq_len = 0

ROWS_BUNCH_SIZE = 2000
READ_BLOCK_SIZE = ROWS_BUNCH_SIZE*ROW_LEN
rows_left = n

while input = $stdin.read(READ_BLOCK_SIZE)

  input = input.bytes.to_a

  i = 0

  rows_read = rows_left < ROWS_BUNCH_SIZE ? rows_left : ROWS_BUNCH_SIZE

  rows_read.times do
    s = input[i] + input[i+2] - 2*ZERO_ORD
    i += ROW_LEN
    if s < TEN
      if s == NINE
        nines_seq_len += 1
      else
        result_buffer << DIGITS[last_below_nine] if last_below_nine 
        result_buffer << NINE_CHR*nines_seq_len if nines_seq_len > 0
        last_below_nine = s
        nines_seq_len = 0
      end
    else
      result_buffer << DIGITS[(last_below_nine||0)+1]
      result_buffer << ZERO_CHR*nines_seq_len if nines_seq_len > 0
      last_below_nine = s-TEN
      nines_seq_len = 0
    end
  end

  rows_left -= ROWS_BUNCH_SIZE

end

print result_buffer
print DIGITS[last_below_nine] if last_below_nine
print NINE_CHR*nines_seq_len if nines_seq_len > 0
