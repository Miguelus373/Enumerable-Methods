# rubocop:disable Style/CaseEquality
  array = [1.0, 2, 3, 4, 5, 6, 7, 8, 9]
# hash = { one: 1, two: 2, three: 3 }
# other_array = %w[Testing how this array thing works Happiness how how how how how]
# other_hash = { desperation: 1, testing: 2, achieving: 3, figuring_out: 4 }
# ma_string = 'somethig different'

module Enumerable
  # 1st method
  def my_each
    if block_given?
      if is_a? Array
        (0...(length)).each do |i|
          yield(self[i])
        end
      else
        (0...(length)).each do |i|
          hash = to_a
          yield(hash[i])
        end
      end
    else
      puts "Enumerator #{self}:my_each"
    end
  end

  # 2nd Method
  def my_each_with_index
    if block_given?
      if is_a? Array
        (0...(length)).each do |j|
          i = self[j]
          yield(i, j)
        end
      else
        (0...(length)).each do |j|
          hash = to_a
          yield(hash[j], j)
        end
      end
    else
      puts "Enumerator #{self}:my_each_with_index"
    end
  end

  # 3rd method
  def my_select
    if block_given?
      new_arr = []
      if is_a? Array
        (0...(length)).each do |i|
          item = self[i]
          new_arr.push(item) if yield(item)
        end
        new_arr
      else
        new_hash = {}
        key = keys
        value = values
        (0...(length)).each do |i|
          new_hash.store(key[i], value[i]) if yield(key[i], value[i])
        end
        new_hash
      end
    else
      puts "Enumerator #{self}:my_select"
    end
  end

  # 4th method
  def my_all?
    if block_given?
      case has_a_block
        when is_a? Array
          (0...(length)).each do |i|
            return false unless yield(self[i])
          true
          end
        end
        when is_a? Hash
          key = keys
          value = values
          (0...(length)).each do |i|
            return false unless yield(key[i], value[i])
          true
          end
        end
      end
    else
    true
    end
  end

  # 5th method
  def my_any?
    if !block_given?
      true
    elsif is_a? Array
      (0...(length)).each do |i|
        return true if yield(self[i])
      end
      false
    else
      key = keys
      value = values
      (0...(length)).each do |i|
        return true if yield(key[i], value[i])
      end
      false
    end
  end

  # 6th method
  def my_none?
    if !block_given?
      false
    elsif is_a? Array
      (0...(length)).each do |i|
        return false if yield(self[i])
      end
      true
    else
      key = keys
      value = values
      (0...(length)).each do |i|
        return false if yield(key[i], value[i])
      end
      true
    end
  end

  # 7th method
  def my_count(compare = 'none')
    return puts length if !block_given? && compare == 'none'

    count = 0

    if compare == 'none'
      (0...(length)).each do |i|
        count += 1 if yield(self[i])
      end
    else
      puts 'warning: given block not used'
      (0...(length)).each do |i|
        count += 1 if compare == self[i]
      end
    end

    count
  end
  # 7th method ends here

  # 8th method

  #   def my_map
  #     unless block_given?
  #       return puts 'Enumerator #{self}:my_map'
  #     else
  #       new_arr = []
  #       if self.is_a? Array
  #         for i in 0...(self.length)
  #             new_arr.push(yield(self[i]))
  #         end
  #       elsif self.is_a? Hash
  #         key = self.keys
  #         value = self.values
  #         for i in 0...(self.length)
  #           yield(key[i], value[i])
  #           new_arr.push(yield(key[i], value[i]))
  #         end
  #       end
  #       new_arr
  #      end
  #   end

  # 9th method
  def my_inject(num = 'none')
    if num == 'none'
      injection = self[0]
      (1...length).each do |i|
        injection = yield(injection, self[i])
      end
      injection
    else
      injection = num
      (0...length).each do |i|
        injection = yield(injection, self[i])
      end
      injection
    end
  end
  # 9th method ends here

  # 10th method
  def multiply_els
    my_inject { |i, j| i * j }
  end
  # 10th method ends here

  #   def my_map(parameter) #my_map modified for Proc
  #       new_arr = []
  #       if self.is_a? Array
  #         for i in 0...(self.length)
  #           new_arr.push(parameter[self[i]])
  #         end
  #       elsif self.is_a? Hash
  #         key = self.keys
  #         value = self.values
  #         for i in 0...(self.length)
  #           new_arr.push(parameter[key[i], value[i]])
  #         end
  #       end
  #       new_arr
  #   end

  # my_map modified for Proc or block
  def my_map(par = 'none')
    if par == 'none' && !block_given?
      puts "Enumerator #{self}:my_map"
    elsif par == 'none'
      new_arr = []
      if is_a? Array
        (0...(length)).each do |i|
          new_arr.push(yield(self[i]))
        end
      elsif is_a? Hash
        key = keys
        value = values
        (0...(length)).each do |i|
          yield(key[i], value[i])
          new_arr.push(yield(key[i], value[i]))
        end
      end
      new_arr
    else
      new_arr = []
      if is_a? Array
        (0...(length)).each do |i|
          new_arr.push(par[self[i]])
        end
      elsif is_a? Hash
        key = keys
        value = values
        (0...(length)).each do |i|
          new_arr.push(par[key[i], value[i]])
        end
      end
      new_arr
    end
  end
end

module Enumerable_for_mods

end

# array.my_each
# array.my_each_with_index
# array.my_select
p array.my_all?
# p array.my_any?
# p array.my_none?
# array.my_count
# array.my_inject
# array.my_map
# array.inject
# rubocop:enable Style/CaseEquality
