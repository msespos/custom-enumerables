module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_all?
    selected = []
    self.my_each do |element|
      return false if !yield element
    end
    true    
  end
end

puts 'my_all? vs. all?'
fibs1 = [0, 1, 1, 2, 3]
fibs2 = [5, 8, 13, 21, 34]
empty = []
puts fibs1.my_all? { |number| number > 0 }
puts fibs1.all? { |number| number > 0 }
puts fibs2.my_all? { |number| number > 0 }
puts fibs2.all? { |number| number > 0 }
puts empty.my_all? { |number| number > 0 }
puts empty.all? { |number| number > 0 }
fibs1.my_all? { |number| number > 0 }
fibs1.all? { |number| number > 0 }
fibs2.my_all? { |number| number > 0 }
fibs2.all? { |number| number > 0 }
empty.my_all? { |number| number > 0 }
empty.all? { |number| number > 0 }
