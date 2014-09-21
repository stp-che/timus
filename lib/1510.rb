# this solution gets "Time limit exceeded" result

N = gets.to_i
h = {}
max = [0,0]
N.times do
 k = gets
 h[k] = (h[k]||0) + 1
 max = [k, h[k]] if max[1] < h[k]
end
puts max[0]
