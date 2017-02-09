require_relative 'card'

class Deck
  RANK = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUIT = %w(H S C D)

  attr_reader :deck

  def initialize
    @deck = Deck.populate
  end

  def self.populate
    stack = []
    SUIT.each do |suit|
      RANK.each do |rank|
        stack << Card.new(rank, suit)
      end
    end
    stack
  end

  def shuffle
    @deck.shuffle
  end


  #ALTERNATIVE

  #self.populate creates new instance





end
