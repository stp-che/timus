# http://acm.timus.ru/problem.aspx?space=1&num=1209

Problem.describe '1209' do |pr|
  pr.example [4, 3, 14, 7, 6]*"\n", '0 0 1 0'
  pr.example [7, 5051, 612517501, 2, 3, 14, 612517500, 5052]*"\n", '1 1 1 0 0 0 0'

  n = 65535
  input = [n, *((1..n).map{|i| 1+i*(i-1)/2 })]*"\n"
  pr.example input, Array.new(n,1)*' '
end