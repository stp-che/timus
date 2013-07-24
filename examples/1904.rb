# http://acm.timus.ru/problem.aspx?space=1&num=1904

Problem.describe '1904' do |pr|
  pr.example "3\n0 4 2", ['4', '-7 -5', '-3 -1', '1 3', '5 7']*"\n"
  pr.example "2\n0 -4", '0'
  pr.example "3\n1 2 -1", "2\n-1 -1\n3 3"
end