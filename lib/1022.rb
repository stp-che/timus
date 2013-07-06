# coding: utf-8

$n = gets.to_i

$parents = Array.new $n
$depth = Array.new $n

def depth(member)
  $depth[member] ||= begin
    parents = $parents[member]
    if parents.nil?
      0
    else
      parents.map{|p| depth p }.max + 1
    end
  end
end

$n.times{|member|
  children = gets.split ' '
  children.pop
  children.each do |c|
    ($parents[c.to_i-1] ||= []) << member
  end
}

puts (1..$n).to_a.sort_by{|m| depth m-1 } * ' '
