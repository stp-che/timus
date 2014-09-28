# http://acm.timus.ru/problem.aspx?space=1&num=1510

def make_input(values)
  "#{values.size}\n".tap do |s|
    values.each{|v| s << "#{v}\n" }
  end
end

Problem.describe '1510' do |pr|

  pr.example "1\n0", '0'

  pr.example make_input(%w(2 1 1 1)), '1'

  pr.example make_input(%w(2 1 1)), '1'

  pr.example make_input(%w(3 3 4 3 3 4 4)), '3'

  n = 500000
  pr.example make_input(Array.new(n){1}), '1'

  n = 500000
  data = (100000000..100000000+n/2).to_a+Array.new(n/2){100000001}
  pr.example make_input(data.shuffle), '100000001'

end