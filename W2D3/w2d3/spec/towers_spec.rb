require 'rspec'
require 'towers'

describe TowersOfHanoi do
  let(:player) {double("player", :name => "Paco")}
  subject(:towers) { TowersOfHanoi.new(player) }


  describe "#initialize" do

    it "initializes three piles" do
      expect(towers.pile1).to eq([3, 2, 1])

      #separate test
      expect(towers.pile2).to be_empty
      expect(towers.pile3).to be_empty
    end

    it "sets player" do
      expect(towers.player.name).to eq("Paco")
    end
  end

  describe "#move" do

    context "when input valid"

      it "calls #get_move on player" do
        allow(player).to receive(:get_move)
      end

      it "updates piles"

      it "loops until won"

    context "when input invald"

      it "raises error"

  describe "#won?" do

    context "when true"

      it "checks to see if pile1 is empty"

      it "checks to see that pile2 or pile3 is [3, 2, 1]"

    context "when false"
  end
  end

end
