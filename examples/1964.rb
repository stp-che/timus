# http://acm.timus.ru/problem.aspx?space=1&num=1964

Problem.describe '1964' do |pr|
  pr.example "1000000000 2\n800000000 800000000", '600000000'
  pr.example "1000000000 2\n500000000 500000000", '0'
  pr.example "100 3\n80 70 60", '10'
  pr.example "1 10\n1 1 1 1 1 1 1 1 1 1", '1'
  pr.example "10 10\n1 1 1 1 1 1 1 1 1 1", '0'
end