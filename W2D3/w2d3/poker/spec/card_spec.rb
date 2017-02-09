require 'rspec'
require 'card'

describe Card do

  describe "#initialize" do
    subject(:card) { Card.new(8, "H") }


    it "should set a value" do
      expect(card.value).to eq(8)
    end

    it "should set a suit" do
      expect(card.suit).to eq("H")
    end
  end
end
