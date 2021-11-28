module Enumerable
  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end

  def my_inject
    memo = self[0]
    self.my_each_with_index do |_, i|
      memo = yield(memo, self[i + 1]) unless i == self.length - 1
    end
    memo
  end

  def multiply_els
    self.my_inject { |a, b| a * b }
  end  
end

numbers = [1, 2,3, 4, 5]
puts numbers.multiply_els
numbers.multiply_els
