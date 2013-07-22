# http://acm.timus.ru/problem.aspx?space=1&num=1297

Problem.describe '1297' do |pr|
  pr.example 'ThesampletextthatcouldbereadedthesameinbothordersArozaupalanalapuazorA', 'ArozaupalanalapuazorA'
  pr.example 'abcba', 'abcba'
  pr.example 'aaaa', 'aaaa'
  pr.example 'abcdefg', 'a'
  pr.example 'hgrcccaaacccbbbcccxyz', 'cccaaaccc'
  pr.example 'hgrcccaaacccbbbcccaaxyz', 'aacccbbbcccaa'
  pr.example 'axyzyxiopabcbaqqq', 'xyzyx'
  pr.example 'Q', 'Q'
  pr.example 'aabbbaabbb', 'bbbaabbb'
end