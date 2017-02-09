require 'rspec'
require 'deck'

describe Deck do

  describe "Deck::populate" do
    subject(:pre_deck) { Deck.populate }

    it "creates a 52 card deck" do
      expect(pre_deck.length).to eq(52)
    end

    it "checks to see that cards are of class Card" do
      all_card = pre_deck.all? { |card| card.is_a?(Card) }
      expect(all_card).to be(true)
    end

    it "checks if there are 13 hearts in each deck" do
      h_counter = 0
      pre_deck.each { |card| h_counter += 1 if card.suit == "H" }
      expect(h_counter).to eq(13)
    end

    it "checks if there are 13 spades in each deck" do
      s_counter = 0
      pre_deck.each { |card| s_counter += 1 if card.suit == "S" }
      expect(s_counter).to eq(13)
    end

    it "checks if there are 13 clubs in each deck" do
      c_counter = 0
      pre_deck.each { |card| c_counter += 1 if card.suit == "C" }
      expect(c_counter).to eq(13)
    end

    it "checks if there are 13 diamonds in each deck" do
      d_counter = 0
      pre_deck.each { |card| d_counter += 1 if card.suit == "D" }
      expect(d_counter).to eq(13)
    end

    it "checks if there are 4 of each value"
      deck[0..12].map { |card| card.value } == RANK
      deck[13..25].map { |card| card.value } == RANK
      deck[26..38].map { |card| card.value } == RANK
      deck[39..51].map { |card| card.value } == RANK



  end

  describe "#initialize" do

    it "sets @deck instance variable"

  end

  describe

  describe "#shuffle" do

    it "shuffles deck"

  end

end
