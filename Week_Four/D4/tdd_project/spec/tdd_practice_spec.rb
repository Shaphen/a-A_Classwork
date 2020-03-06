require "rspec"
require "tdd_practice"

describe "TDD Practice" do
  
  describe "#my_uniq" do
    let(:arr) {[1,22,3,4,2,2, 8, 8,]}
    it "should remove duplicate numbers from an array" do
      expect(arr.my_uniq).to eq([1,22,3,4,2,8].sort)
    end
  end

  describe "#to_sum" do
    let(:arr) {[-1, 0, 2, -2, 1]}
    it "should sum every pairs of positions that sum to zero" do
      expect(arr.to_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "my_transpose" do
    let(:matrix) {
        [[0, 1, 2], 
        [3, 4, 5], 
        [6, 7, 8]]
      }
    it "should switch rows and columns of an array" do
      expect(matrix.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    let(:arr) { (1..30).to_a.shuffle }
    let(:arr2) { [10, 2, 5, 2, 7, 1, 4] }
    context "picks most profitable pair of days to first buy and sell stock" do
      it "should take in an array" do
        expect(arr.stock_picker).to be_an(Array)
      end
      it "should output an array of length 2" do
        expect(arr2.stock_picker).to eq([1,4])
      end
    end

    it "can not sell the stock before you buy it" do
      expect(arr2.stock_picker).to eq([1,4])
    end
  end
  
end

describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}
  describe "#initialize" do
    it "should have default size of 3" do
      expect(game.size).to eq(3)
    end

    context "3 arrays representing stacks" do
      it "should have 3 stacks: a, b, c" do
        expect(game.a).to be_an(Array)
        expect(game.b).to be_an(Array)
        expect(game.c).to be_an(Array)
      end

      it "should have the first stack represent size given" do
        expect(game.a.length).to eq(game.size)
      end

    end
    describe "#move" do
      it "should take last array_index of selected stack"
      it "should remove ele from previous stack"
      it "should add ele to selected new stack"

      context "should be a valid move" do
        it "should not allow larger disk to be placed on stack with smaller disk"
      end
    end
  end



end
#create_game
  #should generate 3 arrays
  #first array should be populated with [3.2.1]
#move
  #should take last array index of selected stack
  #then should add to the end of selected stack
  #move should be valid 
    #no larger disk can be placed on smaller disk
    #input stack must exist
    #input stack must not be the same stack that its currently on
#won?
  #last stack == original stack
  #all other stacks are empty

