# http://acm.timus.ru/problem.aspx?space=1&num=1209

require_relative 'spec_helper'

describe_problem '1209' do
  _example [4, 3, 14, 7, 6]*"\n", '0 0 1 0'
  _example [7, 5051, 612517501, 2, 3, 14, 612517500, 5052]*"\n", '1 1 1 0 0 0 0'
end