# coding: utf-8
# http://acm.timus.ru/problem.aspx?space=1&num=1027

require_relative 'spec_helper'

describe_problem '1027' do

  _example %{Hello, here is a sample D++ program. It contains some arithmetical expressions like
             (2+2=4), (2+-/*) and ((3+3)*3=20(*this is not true, but you don’t have to verify it :-) *)+8)
             (* the closing bracket in the previous comment is also in order, since this bracket does not belong to any arithmetical expression*)},

           'YES'

  _example ('('*5000) << ')'*5000, 'YES'

  _example "(\r\n3+3\r\n)", 'YES'

  _example "( 3+3 )", 'NO'

end