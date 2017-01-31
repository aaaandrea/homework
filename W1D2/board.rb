require 'byebug'
require_relative 'card.rb'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(2) { Array.new(2) }
    populate
  end

  VALUES = [1, 2]

  def populate
    random_values = VALUES.dup.shuffle + VALUES.dup.shuffle
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |cell, idx2|
        self[[idx1, idx2]] = Card.new(random_values.pop)
      end
    end
  end

  def render
    result = []
    @grid.each do |row|
      result_row = []
      row.each do |card|
        result_row << card.to_s
      end
      result << result_row
    end
    p result
  end

  def won?

  end

  def reveal(guess)
    Card.new(self[guess])
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, card_value)
    row, col = pos
    @grid[row][col] = card_value
  end

end
