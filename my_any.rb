module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_any?
    selected = []
    self.my_each do |element|
      return true if yield element
    end
    false
  end
end

puts 'my_any? vs. any?'
fibs1 = [0, 1, 1, 2, 3]
fibs2 = [5, 8, 13, 21, 34]
empty = []
puts fibs1.my_any? { |number| number > 5 }
puts fibs1.any? { |number| number > 5 }
puts fibs2.my_any? { |number| number > 5 }
puts fibs2.any? { |number| number > 5 }
puts empty.my_any? { |number| number > 5 }
puts empty.any? { |number| number > 5 }
