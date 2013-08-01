# http://acm.timus.ru/problem.aspx?space=1&num=1196

Problem.describe '1196' do |pr|

  pr.example [2,
              1054,
              1492,
              4,
              1492,
              65536,
              1492,
              100]*"\n", 

             '2'

  n = 15000
  m = 1000000
  input = [n] + (1..n).map{rand(1..10000)}.sort + [m] + (1..m).map{rand(20000..50000)}
  pr.example input*"\n", '0'

  n = 15000
  m = 1000000
  check = (1..n).map{rand(1..10000)}
  input = [n] + check.sort + [m] + (check + (1..m-n).map{rand(20000..50000)}).shuffle
  pr.example input*"\n", "#{n}"


end