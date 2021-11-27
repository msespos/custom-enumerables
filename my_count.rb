module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_count(*args)
    count = 0
    self.my_each do |element|
      if args != []
        count += 1 if args[0] == element
      elsif block_given?
        count += 1 if yield element
      else
        count += 1
      end
    end
    count
  end
end

puts 'my_count vs. count'
fibs = [0, 1, 1, 2, 3]
puts fibs.my_count
puts fibs.count
puts fibs.my_count(1)
puts fibs.count(1)
puts fibs.my_count(nil)
puts fibs.count(nil)
puts fibs.my_count(0) { |number| number.odd? }
puts fibs.count(0) { |number| number.odd? }
puts fibs.my_count { |number| number.odd? }
puts fibs.count { |number| number.odd? }
fibs.my_count
fibs.count
fibs.my_count(1)
fibs.count(1)
fibs.my_count(nil)
fibs.count(nil)
fibs.my_count(0) { |number| number.odd? }
fibs.count(0) { |number| number.odd? }
fibs.my_count { |number| number.odd? }
fibs.count { |number| number.odd? }
