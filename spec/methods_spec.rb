require './enumerable_methods.rb'

describe Enumerable do
  test_array = [1, 2, 4, 8, 16, 32, 64]

  describe '#my_each' do
    it 'returns an enumerator when no block is given' do
      expect(test_array.my_each).to be_an Enumerator
    end

    it 'returns an object after calling the block for each element in the array' do
      expect(test_array.my_each { |i| p i }).to be_an Object
    end

    it 'returns an object after calling the block for each element in the range' do
      expect((1..10).my_each { |i| p i }).to be_an Object
    end
  end

  describe '#my_each_with_index' do
    it 'returns an enumerator when no block is given' do
      expect(test_array.my_each_with_index).to be_an Enumerator
    end

    it 'returns an object after calling the block for each element in the array' do
      expect(test_array.my_each_with_index { |i| p i }).to be_an Object
    end

    it 'returns an object after calling the block for each element in the range' do
      expect((1..10).my_each_with_index { |i| p i }).to be_an Object
    end
  end

  describe '#my_select' do
    it 'returns an enumerator when no block is given' do
      expect(test_array.my_select).to be_an Enumerator
    end

    it 'returns an array of the elements that meet the block\'s condition' do
      expect(test_array.my_select { |i| i > 16 }).to eql([32, 64])
    end

    it 'returns an array of the elements of the range that meet the block\'s condition' do
      expect((1..25).my_select { |i| (i % 5).zero? }).to eql([5, 10, 15, 20, 25])
    end
  end
end
