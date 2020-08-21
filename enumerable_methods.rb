# rubocop:disable Style/CaseEquality
array = [1,2,3,4,5,6,7,8,9]
hash = {one: 1, two: 2, three: 3}
other_array = ["Testing", "how", "this", "array", "thing", "works"]
other_hash = {desperation: 1, testing: 2, achieving: 3, figuring_out: 4}

module Enumerable
  def my_each #First method
    unless block_given?
      return puts 'Enumerator #{self}:my_each'
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
  end #First method ends here

  def my_each_with_index #Second Method
    unless block_given?
      return puts "Enumerator #{self}:my_each_with_index"
    else
      if self.is_a? Array
        for j in 0...(self.length)
          i = self[j]
          yield(i, j)
        end
      else
        for j in 0...(self.length)
          hash = self.to_a
          yield(hash[j], j)
        end
      end
    end
  end #Second Method ends here

  def my_select # Third method
    unless block_given?
      return puts "Enumerator #{self}:my_select"
    else
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
          item = self[i]
          if yield(item)
            new_arr.push(item)
            puts 'ok'
          end
        end
        p new_arr
      else 
        new_hash = {}
        for i in 0...(self.length)
        key = self.keys
        value = self.values
          if yield(key[i], value[i])
            new_hash.store(key[i], value[i])
          end
        end
        puts new_hash
      end
    end
  end # Third method ends here

end

other_hash.my_select {|i, j| i.length > 8}
