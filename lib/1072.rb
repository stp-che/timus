require 'set'

N = gets.to_i

$hosts = []
$subnetworks = {}

def add_host(n)
  gets.to_i.times{ add_interface n, *gets.split }
end

def add_interface(host_num, address, mask)
  network_address = parse_address(address) & parse_address(mask)
  add_host_to_subnetwork network_address, host_num
end

def parse_address(address)
  a,b,c,d = address.split('.').map(&:to_i)
  (a << 24) + (b << 16) + (c << 8) + d
end

def add_host_to_subnetwork(network_address, host_num)
  network = $subnetworks[network_address] ||= Set.new
  host = $hosts[host_num] ||= Set.new
  $hosts[host_num] += network
  network.each{|i| $hosts[i] << host_num }
  network << host_num
end

def find_path(from, to)
  d = Array.new N
  d[from] = [0, from]
  last_marked = [from]
  until last_marked.empty? || d[to]
    marked = []
    last_marked.each do |i|
      $hosts[i].each do |j|
        unless d[j]
          d[j] = [d[i][0]+1, i]
          marked << j
        end
      end
    end
    last_marked = marked
  end
  if d[to]
    path = [to]
    i = to
    d[to][0].times do 
      i = d[i][1]
      path << i
    end
    path.reverse
  end
end

N.times{|i| add_host i}
from, to = gets.split.map(&:to_i)
path = find_path from-1, to-1
unless path
  puts 'No'
else
  puts 'Yes'
  puts path.map{|i| i+1}.join(' ')
end
