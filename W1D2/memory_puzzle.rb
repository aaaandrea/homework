require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'player.rb'


class Game
  attr_reader :previous_guess, :current_guess, :board

  def initialize
    @board = Board.new
  end

  def play
    until over?
      @board.render
      current_guess
      previous_guess
      compare_guess(@current_guess, @previous_guess)
    end
  end

  def guess
    print "Guess position 1: Ex: 0, 0 "
    guess = gets.chomp
    guess.split(", ").map { |num| num.to_i }
  end

  def current_guess
    @current_guess = self.guess
  end

  def previous_guess
    @previous_guess = self.guess
  end

  def compare_guess(guess_one, guess_two)
    p card1 = @board[guess_one]
    p card2 = @board[guess_two]

    if card1 == card2
      @board[guess_one] = card1.reveal.to_s
      @board[guess_two] = card2.reveal.to_s
    else
      @board[guess_one] = card1.to_s
      @board[guess_two] = card2.to_s
    end

  end

  def mark(guess)
    @board[guess] = @board.reveal(guess)
  end

  def over?
    @board.won?
  end

end
