# spec/enumerable_spec.rb
require_relative '../enumerable_methods'

describe Enumerable do
  describe '#my_each' do
    let(:arr) { [2, 3, 5] }
    let(:hash) { { name: 'John', last: 'Doe' } }
    it 'Returns the Enumerator if no block given' do
      expect(arr.my_each).to be_an Enumerator
    end

    it 'When print the elements of the iteration' do
      expect do
        arr.each { |el| p el }
      end.to output("2\n3\n5\n").to_stdout
    end

    it 'When modify the elements of the iteration' do
      expect do
        arr.each { |el| p el + el }
      end.to output("4\n6\n10\n").to_stdout
    end

    it 'When modify the elements of the iteration' do
      expect do
        arr.each { |el| p el + el }
      end.to output("4\n6\n10\n").to_stdout
    end

    it 'When a hash is passed' do
      expect do
        hash.each { |el| p el }
      end.to output("[:name, \"John\"]\n[:last, \"Doe\"]\n").to_stdout
    end
  end
end
