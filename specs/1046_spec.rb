# http://acm.timus.ru/problem.aspx?space=1&num=1046

require_relative 'spec_helper'

describe_problem '1046' do

  _example [3,
            '0 2',
            '3 3',
            '2 0',
            90,
            90,
            90]*"\n",

            ['1 1', '1 3', '3 1']*"\n"
  
end