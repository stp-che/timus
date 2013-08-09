# http://acm.timus.ru/problem.aspx?space=1&num=1117

Problem.describe '1117' do |pr|
  pr.example '1 5', '2'
  pr.example '1 3', '0'
  pr.example '8 4', '3'
  pr.example '1 32', '26'
  pr.example '21 23', '0'
  pr.example '715827883 1431655765', proc{'benchmarking'}
end