# http://acm.timus.ru/problem.aspx?space=1&num=1190

Problem.describe '1190' do |pr|
  pr.example ['4',
              'Water 0',
              'Cocoa-butter 0',
              'Cocoa-powder 1 4000',
              'Lecithin 0'].join("\n"),

             "NO"

  pr.example ['2',
              'Water 1000',
              'Cocoa-butter 1001'].join("\n"),

              'NO'

  pr.example ['4',
              'A 0',
              'B 0',
              'C 0',
              'D 0'].join("\n"),

             "YES"

  pr.example ['4',
              'A 1 2500',
              'B 1 2500',
              'C 1 2500',
              'D 1 2500'].join("\n"),

             "YES"

  pr.example ['3',
              'A 1 3333',
              'B 1 3333',
              'C 1 3333'].join("\n"),

             "NO"

  pr.example ['4',
              'A 0',
              'B 0',
              'C 1 2500',
              'D 0'].join("\n"),

             "YES"

  pr.example ['4',
              'A 0',
              'B 0',
              'C 1 2499',
              'D 0'].join("\n"),

             "YES"

  pr.example ['4',
              'A 1 2500',
              'B 1 2500',
              'C 1 2499',
              'D 0'].join("\n"),

             "NO"

  pr.example ['4',
              'A 1 2502',
              'B 1 2500',
              'C 1 2499',
              'D 0'].join("\n"),

             "YES"

  input = ['5000']
  5000.times{|i| input << "a#{i} 1 2"}
  pr.example input.join("\n"), 'YES'
end