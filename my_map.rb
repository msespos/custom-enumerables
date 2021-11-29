module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_map(*args)
    elements = []
    self.my_each do |element|
      if args != []
        elements << args[0].call(element)
      else
        elements << yield(element)
      end
    end
    elements
  end
end

puts 'my_map vs. map'
numbers = [1, 2, 3, 4, 5]
my_proc = Proc.new { |item| item ** 2 }
puts numbers.my_map { |item| item ** 2 }
puts numbers.map { |item| item ** 2 }
puts numbers.my_map(&my_proc)
puts numbers.map(&my_proc)
puts 'my_map takes a proc'
puts numbers.my_map(my_proc)
puts 'my map takes a proc and a block'
puts numbers.my_map(my_proc) { |item| item ** 2 }
numbers.my_map { |item| item ** 2 }
numbers.map { |item| item ** 2 }
numbers.my_map(&my_proc)
numbers.map(&my_proc)
numbers.my_map(my_proc)
numbers.my_map(my_proc) { |item| item ** 2 }
