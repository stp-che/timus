# http://acm.timus.ru/problem.aspx?space=1&num=1226

Problem.describe '1226' do |pr|

  pr.exact_output = true

  pr.example %(This is an example of a simple test. If you did not 
               understand the ciphering algorithm yet, then write the 
               letters of each word in the reverse order. By the way, 
               "reversing" the text twice restores the original text.), 

             %(sihT si na elpmaxe fo a elpmis tset. fI uoy did ton 
               dnatsrednu eht gnirehpic mhtirogla tey, neht etirw eht 
               srettel fo hcae drow ni eht esrever redro. yB eht yaw, 
               "gnisrever" eht txet eciwt serotser eht lanigiro txet.),

             :exactly

  pr.example '1234', '1234', :exactly

  pr.example 'test1abc', 'tset1cba', :exactly

  pr.example '   ', '   ', :exactly

end

