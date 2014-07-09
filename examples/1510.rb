# http://acm.timus.ru/problem.aspx?space=1&num=1510

def make_input(values)
  "#{values.size}\n".tap do |s|
    values.each{|v| s << "#{v}\n" }
  end
end

Problem.describe '1510' do |pr|

  pr.example make_input(%w(2 1 1 1)), '1'

  pr.example make_input(%w(2 1 1)), '1'

  pr.example make_input(%w(3 3 4 3 3 4 4)), '3'

  n = 500000
  pr.example make_input(Array.new(n){1}), '1'

  n = 500000
  pr.example make_input((1..n-1).to_a<<2), '2'

end