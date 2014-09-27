# http://acm.timus.ru/problem.aspx?space=1&num=1581

Problem.describe '1581' do |pr|
  pr.example "8\n1 1 2 3 3 3 10 10", '2 1 1 2 3 3 2 10'
  pr.example "8\n1 1 1 1 1 1 1 1", '8 1'
  pr.example "8\n1 2 3 4 5 6 7 8", '1 1 1 2 1 3 1 4 1 5 1 6 1 7 1 8'
  pr.example "1\n7", '1 7'
  pr.example "20\n1 1 3 3 3 4 1 1 1 1 1 6 7 7 7 4 4 4 4 4", '2 1 3 3 1 4 5 1 1 6 3 7 5 4'
end