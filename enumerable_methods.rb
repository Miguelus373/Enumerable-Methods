# rubocop:disable Style/CaseEquality
array = [1,2,3,4,5,6,7,8,9]
hash = {one: 1, two: 2, three: 3}

module Enumerable
  def my_each
    unless block_given?
      return puts 'No block given'
    else
      if self.is_a? Array
        for i in 0...(self.length)
          yield(self[i])
        end
      else
        for i in 0...(self.length)
          hash = self.to_a
          yield(hash[i])
        end
      end
    end
  end
end
