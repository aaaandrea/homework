require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
<<<<<<< HEAD
    it "sets a type" do
      
    end

    it "sets a quantity" do
    end

    it "starts ingredients as an empty array" do

    end

    it "raises an argument error when given a non-integer quantity" do

    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do

    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do

    end

    it "raises an error if the amount is greater than the quantity" do

    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do

    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do

    end
=======
    it "sets a type"

    it "sets a quantity"

    it "starts ingredients as an empty array"

    it "raises an argument error when given a non-integer quantity"
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
>>>>>>> dd2c4355c0255a483325a9319569ff5d7d4d5f0e
  end
end
