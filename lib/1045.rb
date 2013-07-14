class Game
  LOSE_MSG = 'First player loses'
  WIN_MSG = 'First player wins flying to airport %d'

  attr_reader :airports_count

  def initialize(n, start_point)
    @airports_count = n
    @start_point = start_point-1
    @adjacents = Array.new(n){ [] } #adjacents
  end

  def add_flight(i,j)
    @adjacents[i-1] << j-1
    @adjacents[j-1] << i-1
  end

  def result
    @result ||= begin
      airport = @adjacents[@start_point].sort.find{|a| first_wins?(2, a, @start_point) }
      airport ? WIN_MSG % (airport+1) : LOSE_MSG
    end
  end

  def first_wins?(player, airport, arrived_from)
    player == 1 && @adjacents[airport].any?{|a| a != arrived_from && first_wins?(2, a, airport) } ||
    player == 2 && !@adjacents[airport].any?{|a| a != arrived_from && !first_wins?(1, a, airport) }
  end
end

game = Game.new *gets.split.map(&:to_i)
(game.airports_count-1).times do
  game.add_flight *gets.split.map(&:to_i)
end

puts game.result