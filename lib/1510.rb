$stdin.binmode

N = $stdin.gets.to_i

class MyInput
  BLOCK_SIZE = 256*1024

  def next
    if @lines.nil? || @current_index == @lines.length - 1
      @lines = next_block
      @current_index = 0
    else
      @current_index += 1
    end
    @lines[@current_index]
  end

  private

  LINE_END = "\n"

  def next_block
    if data = read_stdin(BLOCK_SIZE)
      unless data[-1] == LINE_END
        loop do
          c = read_stdin 1
          data << c if c
          break if c.nil? || c == LINE_END
        end
      end
      data.split(/\s+/)
    end
  end

  def read_stdin(bytes)
    $stdin.read(bytes).tap{|data| @eof = data.nil? } unless @eof
  end

end

input = MyInput.new
candidate = nil
power = 0

N.times do
  cur = input.next
  if power == 0
    candidate = cur
    power = 1
  elsif candidate == cur
    power += 1
  else
    power -= 1
  end
end

puts candidate