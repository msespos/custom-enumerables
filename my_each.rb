module Enumerable
  def my_each
    if self.class == Array
      for i in 0..self.length - 1
        yield self[i]
      end
    else
      for key, self[key] in self
        yield key, self[key]
      end
    end
    self
  end
end

puts 'my_each vs. each'
numbers = [1, 2, 3, 4, 5]
numbers_hash = { one: 1, two: 2, three: 3 }
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }
numbers_hash.my_each { |key, value| puts key, value }
numbers_hash.each { |key, value| puts key, value }