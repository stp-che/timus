# http://acm.timus.ru/problem.aspx?space=1&num=1019

require_relative 'spec_helper'

describe_problem '1019' do

  _example ['4',
            '1 999999997 b',
            '40 300 w',
            '300 634 w',
            '43 47 b']*"\n", 

           '47 634'

  _example '0', '0 1000000000'

  _example "1\n100 1000 w", '0 1000000000'

  _example ['1',
            '1 999999999 b']*"\n", 

           '0 1'

end