module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_none?
    self.my_each do |element|
      return false if yield element
    end
    true    
  end
end

puts 'my_none? vs. none?'
fibs1 = [0, 1, 1, 2, 3]
fibs2 = [5, 8, 13, 21, 34]
empty = []
puts fibs1.my_none? { |number| number > 5 }
puts fibs1.none? { |number| number > 5 }
puts fibs2.my_none? { |number| number > 5 }
puts fibs2.none? { |number| number > 5 }
puts empty.my_none? { |number| number > 5 }
puts empty.none? { |number| number > 5 }
fibs1.my_none? { |number| number > 5 }
fibs1.none? { |number| number > 5 }
fibs2.my_none? { |number| number > 5 }
fibs2.none? { |number| number > 5 }
empty.my_none? { |number| number > 5 }
empty.none? { |number| number > 5 }
