require 'fileutils'
require 'uuid'

LIB_PATH = File.expand_path File.join(File.dirname(__FILE__), 'lib')
EXAMPLES_PATH = File.expand_path File.join(File.dirname(__FILE__), 'examples')

class Executing
  def initialize(command, input)
    @command = command
    @input = input
    @performed = false
  end

  def output
    @output ||= begin
      perform
      out[0].read
    end
  end

  def error
    @error ||= begin
      perform
      err[0].read
    end
  end

  def time
    perform unless @time
    @time
  end

  private

  def perform
    return if @performed
    File.open(input_file,'w'){|f| f << @input}
    t = Time.now.to_f
    Process.wait spawn(@command, in: [input_file], out: out[1], err: err[1] )
    @time = Time.now.to_f - t
    out[1].close
    err[1].close
    FileUtils.rm input_file
    @performed = true
  end

  def out
    @out ||= IO.pipe
  end

  def err
    @err ||= IO.pipe
  end

  def input_file
    @input_file ||= UUID.generate
  end

end

class Solution
  def initialize(problem_id, type='rb')
    @problem_id = problem_id
    @type = type
  end
  def src_file
    @src_file ||= "#{LIB_PATH}/#{@problem_id}.#{@type}" 
  end
  def execute(input)
    Executing.new("ruby #{src_file}", input)
  end
end

class Problem
  class << self
    def describe(problem_id, &block)
      problem = new problem_id
      @problems[problem_id] = problem
      yield problem if block_given?
    end
    def [](problem_id)
      @problems[problem_id]
    end
    def _load(problem_id)
      require "#{EXAMPLES_PATH}/#{problem_id}.rb"
      @problems[problem_id]
    end
  end

  @problems = {}

  attr_reader :id, :examples

  def initialize(id)
    @id = id
    @examples = []
  end

  def example(input, output)
    @examples << [input, output]
  end
end

# s = Solution.new '1019'
# pr = Problem._load '1019'

# r = s.execute(pr.examples[4][0])
# puts r.output