require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      4.times do
        @cups[i] << :stone unless i == 6 || i == 13
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos <= 0
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    stones, @cups[start_pos] = @cups[start_pos], []
    i = start_pos + 1
    until stones.empty?
      i = i % 13

      @cups[i] << stones.pop
      i += 1
    end
    render
    next_turn(i - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].length == 1
      return :switch
    end
    :prompt
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].empty? || @cups[6..14].empty?
    false
  end

  def winner
  end
end
