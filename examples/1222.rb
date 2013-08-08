# http://acm.timus.ru/problem.aspx?space=1&num=1222

Problem.describe '1222' do |pr|
  pr.example '5', '6'
  pr.example '6', '9'
  pr.example '16', '324'
  pr.example '3000', proc{ 'benchmarking' }
end