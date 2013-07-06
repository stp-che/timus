# coding: utf-8
require 'rspec'
require 'rspec/autorun'

LIB_PATH = File.expand_path File.join(File.dirname(__FILE__), '..', 'lib')

def describe_problem(problem_id, &block)
  describe problem_id do
    let(:problem_id){ problem_id }
    class_eval &block if block_given?
  end
end

def _example(input, expected_output)
  specify do
    output = get_output "#{LIB_PATH}/#{problem_id}.rb", input
    output.strip.should == expected_output
  end
end

def get_output(src_file, input)
  IO.popen "ruby #{src_file}", 'r+' do |io|
    io << input
    io.close_write
    io.read
  end
end