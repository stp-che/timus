# http://acm.timus.ru/problem.aspx?space=1&num=1048

Problem.describe '1048' do |pr|

  pr.example ['4',
              '0 4',
              '4 2',
              '6 8',
              '3 7']*"\n", 

             '4750'

  pr.example ['4',
              '0 9',
              '0 9',
              '0 9',
              '1 9']*"\n", 

             '10000'

  pr.example ['4',
              '5 5',
              '1 1',
              '1 1',
              '1 1']*"\n", 

             '10222'

  n = 1000000
  input = [n, *['0 9']*(n-1)] << '1 9'
  pr.example input*"\n", '1' << ('0'*n)

  n = 1000000
  input = [n, *['9 9']*n]
  pr.example input*"\n", '1' << ('9'*(n-1)) << '8'

  pr.example [5,
              '2 4',
              '1 8',
              '2 7',
              '3 6',
              '4 5']*"\n",

            '69999'

  pr.example [4,
              '1 8',
              '2 7',
              '3 6',
              '4 5']*"\n",

            '9999'


end