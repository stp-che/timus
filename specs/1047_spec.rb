# http://acm.timus.ru/problem.aspx?space=1&num=1047

require_relative 'spec_helper'

describe_problem '1047' do

  _example [1,
            '50.50',
            '25.50',
            '10.15']*"\n",

           '27.85' 

  _example [1,
            '1.00',
            '9.00',
            '2.00']*"\n",

           '3.00' 
end