describe "Array Math" do

  let(:a) { [ 4, 5, 6 ] }
  let(:b) { [ 7, 8, 9 ] }

  let(:evens) { [ 2, 4, 6 ] }
  let(:odds) { [ 7, 9, 11 ] }

  let(:animals)     { ["aardvark", "hedgehog", "wallaby"] }
  let(:ingredients) { ["anise",    "honey",    "wasabi" ] }

  describe "#plus" do
    it "doesn't use Ruby's plus method" do
      expect(a).to_not receive(:+)
      expect(b).to_not receive(:+)
      a.plus(b)
    end

    it "doesn't change either array" do
      a.plus(b)
      expect(a).to eq(a)
      expect(b).to eq(b)
    end

    it "adds two arrays together" do
      expect(b.plus(a)).to eq([ 7, 8, 9, 4, 5, 6 ])
      expect(evens.plus(odds)).to eq([ 2, 4,  6, 7, 9, 11 ])
      expect(odds.plus(evens)).to eq([ 7, 9, 11, 2, 4,  6 ])
      result = ["aardvark", "hedgehog", "wallaby", "anise", "honey", "wasabi"]
      expect(animals.plus(ingredients)).to eq(result)
    end
  end

  describe "#asterisk" do
    it "doesn't use Ruby's asterisk method" do
      expect_any_instance_of(Array).to_not receive(:*)
      a.asterisk(3)
    end

    it "doesn't change the array" do
      a.asterisk(3)
      expect(a).to eq(a)
    end

    context "Integer Argument" do
      it "duplicates items in array 'arg' number of times" do
        expect(a.asterisk(3)).to eq([4, 5, 6, 4, 5, 6, 4, 5, 6])
        expect(b.asterisk(2)).to eq([7, 8, 9, 7, 8, 9])
        result = ["aardvark", "hedgehog", "wallaby", "aardvark", "hedgehog", "wallaby"]
        expect(animals.asterisk(2)).to eq(result)
      end
    end

    context "String Argument" do
      it "joins the array by the argument" do
        expect(animals.asterisk(", ")).to eq("aardvark, hedgehog, wallaby")
        expect(ingredients.asterisk("+")).to eq("anise+honey+wasabi")
      end
    end
  end

  describe "#ampersand" do
    let(:first_prime)    { [  2,  3,  5,  7, 11, 13, 17, 19, 23, 29 ] }
    let(:reversed_prime) { [ 29, 23, 19, 17, 13, 11,  7,  5,  3,  2 ] }
    let(:first_odd)      { [  1,  3,  5,  7,  9, 11, 13, 15, 17, 19 ] }
    let(:multiples_of_5) { [  5, 10, 15, 20, 25, 30, 35, 40, 45, 50 ] }

    let(:alphabet) { ["a", "b", "c", "d", "e", "f", "g", "h", "i"] }
    let(:vowels)   { ["u", "o", "i", "e", "a"] }
    let(:love)     { ["l", "o", "v", "e"] }

    it "doesn't use Ruby's ampersand method" do
      expect_any_instance_of(Array).to_not receive(:&)
      a.ampersand(b)
    end

    it "doesn't change either array" do
      a.ampersand(b)
      expect(a).to eq(a)
      expect(b).to eq(b)
    end

    it "finds the common element and puts it in an array when there is only one" do    
      expect(multiples_of_5.ampersand(first_prime)).to eq([5])
      expect(alphabet.ampersand(love)).to eq(["e"])
    end

    it "returns array of shared elements in the order established by the first_odd
      array when there are two common elements" do
      expect(multiples_of_5.ampersand(first_odd)).to eq([5, 15])
      expect(love.ampersand(vowels)).to eq(["o", "e"])
    end

    it "returns array of shared elements in the order established by the first_odd
      array when there are more than two common elements" do
      expect(alphabet.ampersand(vowels)).to eq(["a", "e", "i"])
      expect(vowels.ampersand(alphabet)).to eq(["i", "e", "a"])
      expect(first_prime.ampersand(first_odd)).to eq([3, 5, 7, 11, 13, 17, 19])
      expect(reversed_prime.ampersand(first_odd)).to eq([19, 17, 13, 11, 7, 5, 3])
    end

    it "returns an empty array when there are no common elements" do
      expect(alphabet.ampersand(first_prime)).to eq([])
    end
  end
end
