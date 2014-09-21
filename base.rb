require 'fileutils'
require 'uuid'

LIB_PATH = File.expand_path File.join(File.dirname(__FILE__), 'lib')
EXAMPLES_PATH = File.expand_path File.join(File.dirname(__FILE__), 'examples')

class Executing
  attr_reader :output, :error, :time

  def initialize(command, input=nil)
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
  class CompilationError < StandardError; end

  BIN_PATH = File.expand_path '../bin', __FILE__

  def initialize(problem_id, type='rb')
    @problem_id = problem_id
    @type = type
  end

  def src_file
    @src_file ||= "#{LIB_PATH}/#{@problem_id}.#{@type}" 
  end

  def execute(input)
    compile unless compiled? if compilation_required?
    case @type
    when 'rb'
      Executing.new("ruby #{src_file}", input)
    when 'scala'
      Executing.new("scala -cp #{BIN_PATH} Pr#{@problem_id}", input)
    end
  end

  def compile
    c = case @type
    when 'scala'
      Executing.new("scalac #{src_file} -d #{BIN_PATH}")
    end
    raise CompilationError, c.error unless c.error.empty?
    @compiled = true
  end

  def compilation_required?
    @type == 'scala'
  end

  def compiled?
    @compiled
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
  attr_accessor :exact_output

  def initialize(id)
    @id = id
    @examples = []
  end

  def example(*ex)
    @examples << ex
  end
end