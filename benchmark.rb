require 'optparse'

OptionParser.new do |o|
  o.on('-p PROBLEM_ID') { |b| $problem_id = b }
  o.on('-e EXAMPLE_NUM') { |b| $example = b.to_i }
  o.on('-d', 'debug mode'){ $debug = true }
  o.on('-h') { puts o; exit }
  o.parse!
end

require_relative 'base'

problem = Problem._load $problem_id
solution = Solution.new $problem_id

N = 100

times = problem.examples.map do |input, _|
  sum = 0
  N.times{ sum += solution.execute(input).time }
  sum/N
end

format = 'example %d: %0.4f'
times.each_with_index{|t, i| puts format % [i+1,t] }