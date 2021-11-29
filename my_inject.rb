module Enumerable
  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end

  def my_inject(*args)
    memo = if args == [] || args[0].is_a?(Symbol) || args[0].is_a?(String)
             self[0]
           elsif args.length == 1
             yield(args[0], self[0])
           else
             args[0]
           end
    self.my_each_with_index do |_, i|
      unless i == self.length - 1
        memo = if args == []
                 yield(memo, self[i + 1])
               elsif args[0].is_a?(Symbol) || args[0].is_a?(String)
                 memo.send(args[0], self[i + 1])
               elsif args.length == 1
                 yield(memo, self[i + 1])
               else
                 memo.send(args[1], self[i + 1])
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
puts numbers.my_inject { |a, b| a - b }
puts numbers.inject { |a, b| a - b }
puts numbers.my_inject(:+)
puts numbers.inject(:+)
puts numbers.my_inject('-')
puts numbers.inject('-')
puts numbers.my_inject(1) { |a, b| a + b }
puts numbers.inject(1) { |a, b| a + b }
puts numbers.my_inject(2, :*)
puts numbers.inject(2, :*)
numbers.my_inject { |a, b| a + b }
numbers.inject { |a, b| a + b }
numbers.my_inject { |a, b| a - b }
numbers.inject { |a, b| a - b }
numbers.my_inject(:+)
numbers.inject(:+)
numbers.my_inject('-')
numbers.inject('-')
numbers.my_inject(1) { |a, b| a + b }
numbers.inject(1) { |a, b| a + b }
numbers.my_inject(2, :*)
numbers.inject(2, :*)
[[:a, 3], [:b, 5], [:a, 6]].my_inject(Hash.new(0)) { |h, v| h[v[0]] += v[1]; h }
[[:a, 3], [:b, 5], [:a, 6]].inject(Hash.new(0)) { |h, v| h[v[0]] += v[1]; h }
[[:a, 3], [:b, 5], [:a, 6]].my_inject(Hash.new(0)) { |h, v| h[v[0]] = v[1]; h }
[[:a, 3], [:b, 5], [:a, 6]].inject(Hash.new(0)) { |h, v| h[v[0]] = v[1]; h }
