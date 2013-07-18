require 'fileutils'
require 'uuid'

LIB_PATH = File.expand_path File.join(File.dirname(__FILE__), 'lib')
EXAMPLES_PATH = File.expand_path File.join(File.dirname(__FILE__), 'examples')

class Executing
  attr_reader :output, :error, :time

  def initialize(command, input)
    @command = command
    @input = input
    perform
  end

  private

  def perform
    File.open(file_in,'w'){|f| f << @input}
    t = Time.now.to_f
    Process.wait spawn(@command, in: file_in, out: file_out, err: file_err )
    @time = Time.now.to_f - t
    FileUtils.rm file_in
    if File.file?(file_out)
      @output = File.read(file_out)
      FileUtils.rm file_out
    end
    if File.file?(file_err)
      @error = File.read(file_err)
      FileUtils.rm file_err
    end
  end

  def file_out
    @file_out ||= UUID.generate
  end

  def file_err
    @file_err ||= UUID.generate
  end

  def file_in
    @file_in ||= UUID.generate
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