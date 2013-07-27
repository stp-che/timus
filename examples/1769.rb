# http://acm.timus.ru/problem.aspx?space=1&num=1769

Problem.describe '1769' do |pr|
  pr.example '10123456789', '11'
  pr.example '112131415161718191022324252627282920334353637383930445464748494055657585950667686960778797088980990', '100'
  pr.example '9'*10**5, '1'
  pr.example '1'<<(Array.new(10**5){ rand(0..9) }).join, proc{ 'for benchmarking' }
end