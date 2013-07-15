# http://acm.timus.ru/problem.aspx?space=1&num=1046

require_relative 'spec_helper'

describe_problem '1643' do

  _example ['5 8',
            '....AA.#',
            '.######!',
            '.....*##',
            '.#######',
            '..B$...B']*"\n",

            '11'

  _example ['3 5',
            '##*..',
            '!#...',
            '##..$']*"\n",

            'Impossible'

  _example ['2 3',
            '!#$',
            '.*.']*"\n",

            'Impossible'
end