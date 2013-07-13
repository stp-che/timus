# http://acm.timus.ru/problem.aspx?space=1&num=1028

require_relative 'spec_helper'

describe_problem '1028' do

  _example [5,
            '1 1',
            '5 1',
            '7 1',
            '3 3',
            '5 5' ]*"\n",

            [1, 2, 1, 1, 0]*"\n"

end