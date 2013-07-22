# http://acm.timus.ru/problem.aspx?space=1&num=1644

Problem.describe '1644' do |pr|

  pr.example ['4',
              '4 hungry',
              '7 satisfied',
              '5 hungry',
              '8 satisfied']*"\n", 

             '7'

  pr.example ['2',
              '6 hungry',
              '5 satisfied']*"\n", 

             'Inconsistent'

end