require 'optparse'

$executing_times = 50

OptionParser.new do |o|
  o.on('-p PROBLEM_ID') { |b| $problem_id = b }
  o.on('-e EXAMPLE_NUM') { |b| $example = b.to_i }
  o.on('-n EXECUTING_TIMES'){|b| $executing_times = b.to_i }
  o.on('-d', 'debug mode'){ $debug = true }
  o.on('-h') { puts o; exit }
  o.parse!
end

require_relative 'base'

problem = Problem._load $problem_id
solution = Solution.new $problem_id

problem.examples.each_with_index do |e, i|
  msg = " example #{i+1}: "
  print msg
  sum = 0
  $executing_times.times{|i|
    sum += solution.execute(e[0]).time
    print "\r#{msg}%d%" % (100*i/$executing_times)
  }
  puts "\r#{msg}%0.4f" % (sum/$executing_times)
end