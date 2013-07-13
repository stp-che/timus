# http://acm.timus.ru/problem.aspx?space=1&num=1033

require_relative 'spec_helper'

describe_problem '1033' do

  _example [5,
            '.....',
            '...##',
            '..#..',
            '..###',
            '.....' ]*"\n",

            '198'

  _example [3,
            '...',
            '.#.',
            '...' ]*"\n",

            '108'

  _example [5,
            '.#...',
            '#....',
            '.....',
            '....#',
            '...#.' ]*"\n",

           '36'

  _example [4,
            '....',
            '....',
            '....',
            '....' ]*"\n",

           '108'

end