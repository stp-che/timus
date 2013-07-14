# http://acm.timus.ru/problem.aspx?space=1&num=1045

require_relative 'spec_helper'

describe_problem '1045' do

  _example ['4 3',
            '3 2',
            '3 1',
            '1 4']*"\n",

           'First player wins flying to airport 2'

  _example ['15 4',
            '4 3',
            '1 3',
            '2 3',
            '4 5',
            '5 7',
            '7 10',
            '4 6',
            '6 8',
            '6 9',
            '8 11',
            '11 14',
            '9 12',
            '9 13',
            '13 15']*"\n",

           'First player wins flying to airport 5'

  _example ['15 4',
            '4 3',
            '1 3',
            '2 3',
            '4 5',
            '5 7',
            '2 10',
            '4 6',
            '6 8',
            '6 9',
            '8 11',
            '11 14',
            '9 12',
            '9 13',
            '13 15']*"\n",

           'First player loses'

  _example ['4 4',
            '1 4',
            '2 4',
            '3 4']*"\n",

           'First player wins flying to airport 1'

end