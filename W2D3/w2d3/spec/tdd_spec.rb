require 'rspec'
require 'tdd'

describe "Array" do

  describe "#my_uniq" do
    subject(:array) { [1, 2, 2, 3, 4] }

    it "removes duplicates from array" do
      expect(array.my_uniq).to eq([1, 2, 3, 4])
    end

    it "does not modifiy original array" do
      array.my_uniq
      expect(array).to eq([1, 2, 2, 3, 4])
    end

    it "does not call Array#uniq" do
      expect(array).not_to receive(:uniq)
      expect(array).not_to receive(:uniq!)
      array.my_uniq
    end

    it "returns a new array" do
      expect(array).not_to be(array.my_uniq)
    end
  end

  describe "#two_sum" do
    subject(:array) { [-1, 0, 2, -2, 1] }
    let(:pairs) { [[0, 4], [2, 3]] }

    it "can handle empty array" do #purpose of asking this?
      expect([].two_sum).to eq([])
    end

    it "returns an array" do
      expect(array.two_sum.is_a?(Array)).to be(true)
    end

    context "Iterating through #two_sum" do

      let!(:answer) {array.two_sum}

      it "returns pairs of indices" do
        #check count of each pair
        all_two = answer.all? { |el| el.length == 2 }
        expect(all_two).to be(true)
      end
      
      it "checks to see that each index pair sums to zero" do
        all_sum_zero = answer.all? { |el| array[el.first] + array[el.last] == 0 }
        expect(all_sum_zero).to be(true)
      end

      it "returns a sorted array" do
        expect(array.two_sum).to eq(pairs.sort)
      end

      it "includes all index pairs that sum to zero" do
        expect(answer).to match(pairs)
      end

      it "returns empty array if no pairs are found" do
        expect([0, 1, 2, 3].two_sum).to be_empty
      end
    end
  end

  describe "#my_transpose" do
    subject(:array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    let(:asymm_array) { [ [0], [3, 4], [6, 7, 8]] }
    let(:transposed) { [[0, 3, 6], [1, 4, 7], [2, 5, 8] ] }

    it "raises an error when length of subarrays don't match" do #necessary?
      expect { asymm_array.my_transpose }.to raise_error(IndexError)
    end

    it "does not call Array#transpose" do
      expect(array).not_to receive(:transpose)
      array.my_transpose
    end

    it "transposes a 3x3 matrix" do
      expect(array.my_transpose).to eq(transposed)
    end

    it "returns a new array" do
      expect(array.my_transpose).not_to be(array)
    end
  end

  describe "stock_picker" do
    subject(:prices) { [5,4,6,8,10,12,3,7] }
    let(:days) { [1, 5] }

    it "returns a pair of day indices" do
      expect(prices.stock_picker.is_a?(Array)).to be(true)
    end

    it "returns sell day > buy day" do
      expect(prices.stock_picker[0] < prices.stock_picker[1]).to be(true)
    end

    it "returns the most profitable days" do #check each possible pair to make sure answer is highest?
      expect(prices.stock_picker).to eq(days)
    end
  end
end
