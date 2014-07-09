require 'optparse'

OptionParser.new do |o|
  o.on('-p PROBLEM_ID') { |b| $problem_id = b }
  o.on('-e EXAMPLE_NUM') { |b| $example = b.to_i }
  o.on('-d', 'debug mode'){ $debug = true }
  o.on('-h') { puts o; exit }
  o.parse!
end

require 'rspec'
require 'rspec/autorun'

require_relative 'base'

problem = Problem._load $problem_id
solution = Solution.new $problem_id

describe problem.id do

  problem.examples.each_with_index do |data, index|
    input, expected_output, exactly = data
    specify "example #{index+1}" do
      r = solution.execute(input)
      raise r.error if r.error && !r.error.empty?
      output = r.output
      puts output if $debug
      output = output.strip unless exactly
      if expected_output.kind_of?(Proc)
        instance_exec output, &expected_output
      else
        output.should == expected_output
      end
    end
  end

end
