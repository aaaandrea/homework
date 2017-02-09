class TowersOfHanoi
  attr_reader :player, :pile1, :pile2, :pile3

  def initialize(player)
    @player = player
    @pile1 = [3, 2, 1]
    @pile2 = []
    @pile3 = []
  end

  def move
    # player.get_move
  end

  def won?
  end

end
