module Enumerable
  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end
end

puts 'my_each_with_index vs. each_with_index'
numbers = [1, 2, 3, 4, 5]
numbers.my_each_with_index  { |item, index| puts "#{item}, #{index}" }
numbers.each_with_index  { |item, index| puts "#{item}, #{index}" }