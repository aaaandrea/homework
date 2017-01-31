class Card
  #display method that shows whether a card is face-up/face-down
  #method that changes the card value
  #value card
  attr_reader :value

  def initialize(value)
    @reveals = false
    @value = value
  end

  def reveal
    @reveals = true
    return @value
  end


  def to_s
    @reveals ? value.to_s : "x"
  end

  def ==(other_card)
    self.value == other_card.value
  end



end
