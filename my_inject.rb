module Enumerable
  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end

  def my_inject(*args)
    memo = self[0]
    self.my_each_with_index do |_, i|
      unless i == self.length - 1
        memo = if args == []
                 yield(memo, self[i + 1])
               else
                 memo.send(args[0], self[i + 1])
               end
      end
    end
    return memo
  end
end

puts 'my_inject vs. inject'
numbers = [1, 2, 3, 4, 5]
puts numbers.my_inject { |a, b| a + b }
puts numbers.inject { |a, b| a + b }
puts numbers.my_inject { |a, b| a * b }
puts numbers.inject { |a, b| a * b }
puts numbers.my_inject(:+)
puts numbers.inject(:+)
puts numbers.my_inject(:*)
puts numbers.inject(:*)
numbers.my_inject { |a, b| a + b }
numbers.inject { |a, b| a + b }
numbers.my_inject { |a, b| a * b }
numbers.inject { |a, b| a * b }
numbers.my_inject(:+)
numbers.inject(:+)
numbers.my_inject(:*)
numbers.inject(:*)
