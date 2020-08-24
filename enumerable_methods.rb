# rubocop:disable Style/CaseEquality
array = [1.0,2,3,4,5,6,7,8,9]
hash = {one: 1, two: 2, three: 3}
other_array = ["Testing", "how", "this", "array", "thing", "works", "Happiness", "how", "how", "how", "how", "how"]
other_hash = {desperation: 1, testing: 2, achieving: 3, figuring_out: 4}
ma_string = "somethig different"

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

  def my_select #Third method
    unless block_given?
      return puts "Enumerator #{self}:my_select"
    else
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
          item = self[i]
          if yield(item)
            new_arr.push(item)
          end
        end
        new_arr
      else 
        new_hash = {}
        key = self.keys
        value = self.values
        for i in 0...(self.length)
          if yield(key[i], value[i])
            new_hash.store(key[i], value[i])
          end
        end
        new_hash
      end
    end
  end #Third method ends here

  def my_all? #Fourth method
    if !block_given?
      return true
    elsif self.is_a? Array
      for i in 0...(self.length)
        unless yield(self[i])
          return false
        end
      end
      return true
    else 
      key = self.keys
      value = self.values
      for i in 0...(self.length)
        unless yield(key[i], value[i])
          return false
        end
      end
      return true
    end
  end #Fourth method ends here

  def my_any? #Fifth method
    if !block_given?
      return true
    elsif self.is_a? Array
      for i in 0...(self.length)
        if yield(self[i])
          return true
        end
      end
      return false
    else 
      key = self.keys
      value = self.values
      for i in 0...(self.length)
        if yield(key[i], value[i])
          return true
        end
      end
      return false
    end
  end #Fifth method ends here

  def my_none? #Sixth method
    if !block_given? 
      return false
    elsif self.is_a? Array
      for i in 0...(self.length)
        if yield(self[i])
          return false
        end
      end
      return true
    else 
      key = self.keys
      value = self.values
      for i in 0...(self.length)
        if yield(key[i], value[i])
          return false
        end
      end
      return true
    end
  end #Sixth method ends here

  def my_count(compare = 'none') #Seventh method 
    if !block_given? && compare == 'none'
      return puts self.length
    end 
      count = 0

      unless compare == 'none'
        puts 'warning: given block not used'
        for i in 0...(self.length)
          if compare == self[i]
            count += 1
          end 
        end
      else
        for i in 0...(self.length)
          if yield(self[i])
            count += 1
          end 
        end
      end
      
    puts count
  end #Seventh method ends here

=begin  
  def my_map #Eighth method
    unless block_given?
      return puts 'Enumerator #{self}:my_map'
    else
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
            new_arr.push(yield(self[i]))
        end
      elsif self.is_a? Hash
        key = self.keys
        value = self.values
        for i in 0...(self.length)
          yield(key[i], value[i])
          new_arr.push(yield(key[i], value[i]))
        end
      end
      new_arr
     end
  end
=end

  def my_inject(num = 'none') #9th method
    if num == 'none'
      injection = self[0]
      for i in 1...self.length
        injection = yield(injection, self[i])
      end
      injection
    else
        injection = num
      for i in 0...self.length
        injection = yield(injection, self[i])
      end
      injection
    end
  end #9th method ends here

  def multiply_els #10th method
      self.my_inject{|i, j| i * j}
  end #10th method ends here

=begin
  def my_map(parameter) #my_map modified for Proc
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
          new_arr.push(parameter[self[i]])
        end
      elsif self.is_a? Hash
        key = self.keys
        value = self.values
        for i in 0...(self.length)
          new_arr.push(parameter[key[i], value[i]])
        end
      end
      new_arr
  end
=end

  def my_map(parameter = 'none') #my_map modified for Proc or block
    if parameter == 'none' && !block_given?
      return puts 'Enumerator #{self}:my_map'
    elsif parameter == 'none'
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
            new_arr.push(yield(self[i]))
        end
      elsif self.is_a? Hash
        key = self.keys
        value = self.values
        for i in 0...(self.length)
          yield(key[i], value[i])
          new_arr.push(yield(key[i], value[i]))
        end
      end
      new_arr
    else
      new_arr = []
      if self.is_a? Array
        for i in 0...(self.length)
          new_arr.push(parameter[self[i]])
        end
      elsif self.is_a? Hash
        key = self.keys
        value = self.values
        for i in 0...(self.length)
          new_arr.push(parameter[key[i], value[i]])
        end
      end
      new_arr
    end
  end
end

my_proc = Proc.new  {|thing| thing*2}
puts array.my_map 