require './enumerable_methods.rb'

my_array = %w[jerry tom dine]

test_array1 = [11, 2, 3, 56]
test_array2 = %w[a b c d]
test_hash = { name: 'John', last: 'Doe' }

# puts 'Test #my_each method'
# p(test_array1.my_each { |x| print x })
# print "\n"
# p(test_array2.my_each { |x| print x })
# print "\n"
# print test_array2.my_each
# print "\n"
# p(test_hash.my_each { |x| print x }) # hash
# puts '- - - -'

# puts 'Test #my_each_with_index method'
# my_array.my_each_with_index do |elem, index|
#   puts "Element: #{elem}  | Index:  #{index}"
# end
# p my_array.my_each_with_index
# test_hash.my_each_with_index do |elem, index|
#  puts "Element: #{elem}  | Index:  #{index}"
# end
# puts '- - - -'

# puts 'Test #my_select method'
# p test_array1.my_select {}
# print "\n"
# p test_array1.my_select {|i| i > 5}
# puts "- - - -\n"

# puts 'Test #my_all method'
# puts(%w[ant bear cat].my_all? { |word| word.length >= 3 })
# puts(%w[ant bear cat].my_all? { |word| word.length >= 4 })
# puts [nil, true, 99].my_all?
# puts [].my_all?
# puts "- - - -\n"

# puts 'Test #my_any method'
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
# puts [nil, true, 99].my_any?
# puts [].my_any?
# puts "- - - -\n"

# puts 'Test #my_none method'
# puts(%w[ant bear cat].my_none? { |word| word.length == 5 })
# puts(%w[ant bear cat].my_none? { |word| word.length >= 4 })
# puts [].my_none?
# puts [nil].my_none?
# puts [nil, false].my_none?
# puts [nil, false, true].my_none?
# puts [nil, false, nil, false].my_none? 
# puts "- - - -\n"

# puts 'Test #my_count method'
# ary = [1, 2, 9, 7, 11, 23, 8]
# puts ary.my_count #=> 7
# puts ary.my_count(9) #=> 1
# puts ary.my_count(2) #=> 1
# puts ary.my_count(&:even?) #=> 2
# puts ary.my_count(&:odd?) #=> 5
# puts "- - - -\n"

# puts 'Test #my_map method'
# print "\n"
# puts 'Map method'
# print([1, 2, 7, 4, 5].map { |x| x * x })
# print "\n"
# puts 'My_Map method'
# print([1, 2, 7, 4, 5].my_map { |x| x * x })
# print "\n"
# puts 'Map method'
# print((1..2).map { |x| x * x })
# print "\n"
# puts 'My_Map method'
# print((1..2).my_map { |x| x * x })
# print "\n"

# my_proc = proc { |x| x * x }
# puts 'My_Map method with block'
# print([1, 2, 7, 4, 5].my_map { |x| x * x })
# print "\n"
# puts 'My_Map method which takes proc as an argument'
# print [1, 2, 7, 4, 5].my_map(my_proc)
# print "\n"

# print "\n"
# puts 'My_Map method without block'
# print [1, 2, 7, 4, 5].my_map
# print "\n"
# puts "- - - -\n"

# puts 'Test #my_inject method'
# puts test_array1.my_inject {|i,j| i + j}
# puts test_array2.my_inject {|i,j| i + j}
# puts "- - - -\n"

# puts 'Test #multiply_els method'
# puts [2, 4, 5].multiply_els #=> 40
# puts "- - - -\n"
