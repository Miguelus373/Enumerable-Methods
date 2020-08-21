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
          if yield(self.my_each {|i| return i})
            new_arr.push(i)
            p "ok"
          end
        end
        p new_arr
      end
    end
  end # Third method ends here
end

array.my_select {|num| puts num > 3 }
