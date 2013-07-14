class DPlusPlusProgram
  ROOT_CTX = 1
  OPENING_BRACE = 2
  SENTENCE = 3
  COMMENT = 4
  COMMENT_STAR = 5
  ERROR = 6

  BRACE_OPEN = '('
  BRACE_CLOSE = ')'
  STAR = '*'

  SENTENCE_ALPHA = /[=+\-*\/0-9]/

  def initialize(source=nil)
    @state = ROOT_CTX
    @braces_depth = 0
    validate(source) if source
  end

  def valid?
    @state != ERROR
  end

  def terminate
    @state = ERROR unless @state == ROOT_CTX
  end

  def validate(source)
    i=0
    while valid? && i<source.size
      input source[i]
      i += 1
    end
    terminate
  end

  def input(char)
    return if char.ord == 13 || char.ord == 10

    case @state
    when ROOT_CTX

      case char
      when BRACE_OPEN
        @state = OPENING_BRACE
        @braces_depth += 1
      when BRACE_CLOSE
        @state = ERROR
      end

    when OPENING_BRACE, SENTENCE

      case char
      when BRACE_OPEN
        @state = OPENING_BRACE
        @braces_depth += 1
      when BRACE_CLOSE
        @braces_depth -= 1
        @state = ROOT_CTX if @braces_depth == 0
      when STAR
        @state = COMMENT if @state == OPENING_BRACE
      when SENTENCE_ALPHA
        @state = SENTENCE
      else
        @state = ERROR
      end

    when COMMENT

      @state = COMMENT_STAR if char == STAR

    when COMMENT_STAR

      if char == BRACE_CLOSE
        @braces_depth -= 1
        @state = @braces_depth == 0 ? ROOT_CTX : SENTENCE
      elsif char != STAR
        @state = COMMENT
      end

    end
  end

end

program = DPlusPlusProgram.new $stdin.read
puts program.valid? ? 'YES' : 'NO'