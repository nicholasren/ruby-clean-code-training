require 'spec_helper'

describe "collection operation" do
  let( :array ) { [1,2,3,4,5,6,7,8,9,10] }

  context 'imperative' do
    it "filtering odd numbers" do
      new_array = []
      for i in array
        new_array << i if i.odd?
      end
      expect(new_array).to eq([1, 3, 5, 7, 9])
    end

    it "reducing summary" do
      sum = 0
      for i in array
        sum += i
      end
      expect(sum).to eq(55)
    end

    it "doubling element" do
      new_array = []
      for i in array
        new_array << i * 2
      end
      expect(new_array).to eq([2,4,6,8,10,12,14,16,18,20])
    end
  end

  context "declarative" do
    it "filtering odd numbers" do
      new_array = array.select{ |x| x.odd? }
      expect(new_array).to eq([1, 3, 5, 7, 9])
    end

    it "reducing summary" do
      sum = array.reduce(0){|acc, x| acc + x}
      expect(sum).to eq(55)
    end


    it "doubling element" do
      new_array = array.map{ |x| x * 2 }
      expect(new_array).to eq([2,4,6,8,10,12,14,16,18,20])
    end
  end

  class A
    def self.all?(arr)
      arr.reduce(true){|acc, x| acc && yield(x)}
    end
  end


  context "all?" do
    A.all?([1,2,4]) do |x|
      x > 0
    end.should == true
    A.all?([-1,2,4])do |x|
      (x > 0)
    end.should  == false
  end

end
