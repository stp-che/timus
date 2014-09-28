require 'set'

N = gets.to_i

useful_dates = Set.new
N.times{ useful_dates << gets.to_i }

M = gets.to_i
dates = $stdin.read.split("\n").map(&:to_i)
count = 0
dates.each{|date| count += 1 if useful_dates.include?(date) }

puts count
