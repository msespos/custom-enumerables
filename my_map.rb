module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_map
    elements = []
    self.my_each do |element|
      elements << yield(element)
    end
    elements
  end
end

puts 'my_map vs. map'
numbers = [1, 2, 3, 4, 5]
puts numbers.my_map { |item| item ** 2 }
puts numbers.map { |item| item ** 2 }
numbers.my_map { |item| item ** 2 }
numbers.map { |item| item ** 2 }