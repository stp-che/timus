# http://acm.timus.ru/problem.aspx?space=1&num=1491

Problem.describe '1491' do |pr|
  pr.example ['4',
              '2 3 2',
              '2 4 1',
              '3 4 1',
              '1 2 1',
              '1 1 1'].join("\n"),

             "2 4 4 2"

  pr.example ['7',
              '1 7 1',
              '2 3 4',
              '3 5 3',
              '1 2 1',
              '5 7 4',
              '2 4 10',
              '3 4 2',
              '1 6 3'].join("\n"),

              '5 19 23 19 11 8 5'

  n = 100_000
  input = [n.to_s]
  input << [1, n, 1].join(' ')
  (1..n-1).each{|i| input << [i+1, n, 1].join(' ') }
  input << [1, n-1, 1].join(' ')
  expected_res = ((1..n-1).map{|i| i+1} << n).join(' ')
  pr.example input.join("\n"), expected_res
end