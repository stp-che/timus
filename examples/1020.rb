# http://acm.timus.ru/problem.aspx?space=1&num=1020

Problem.describe '1020' do |pr|

  pr.example ['4 1',
              '0.0 0.0',
              '2.0 0.0',
              '2.0 2.0',
              '0.0 2.0']*"\n", 

             '14.28'

  pr.example "1 2\n0.0 0.0", '12.57' 
  pr.example "2 1\n0.0 0.0\n2.0 0.0", '10.28'

  # правильный 100-угольник радиуса 100
  n = 100
  angle = Math::PI/50
  data = (0..99).map{|i| [100*Math.cos(i*angle), 100*Math.sin(i*angle)] }
  pr.example ['100 1', *(data.map{|pt| '%f %f' % pt })]*"\n", '634.5'

end