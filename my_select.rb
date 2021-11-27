module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_select
    selected = []
    self.my_each do |element|
      selected << element if yield element
    end
    selected
  end
end

puts 'my_select vs. select'
numbers = [1, 2, 3, 4, 5]
puts numbers.my_select { |item| item.even? }
puts numbers.select { |item| item.even? }
numbers.my_select { |item| item.even? }
numbers.select { |item| item.even? }
