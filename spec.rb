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

  problem.examples.each do |input, expected_output|
    specify do
      output = solution.execute(input).output
      puts output if $debug
      output.strip.should == expected_output
    end
  end

end
