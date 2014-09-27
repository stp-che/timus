# http://acm.timus.ru/problem.aspx?space=1&num=1881

Problem.describe '1881' do |pr|
  pr.example "3 5 6\n" + %w(To be or not to be)*"\n", '2'
  pr.example "1 1 1\na", '1'
  pr.example "1 2 3\naa\nbb\ncc", '3'
  pr.example "4 10 21\n" + 
              %w(
                aa bbbb ccc dddd e fffff ggggggggg hhh i j kkk lllll 
                m nnnnnnnnn oo ppppp qqqq rrrrr sss ttt uuuuuuuuuu
              )*"\n",
    
              '3'

  pr.example "1 1 1\naa", '2'

  words = 10000.times.map{ 'x'*rand(1..70) }
  pr.example "50 70 10000\n" + words*"\n", proc{ 'for benchmarking' }
end

