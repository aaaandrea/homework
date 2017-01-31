#Write a function sum_to(n) that uses recursion to calculate the sum
#from 1 to n (inclusive of n).
def sum_to(n)
  return 1 if n == 1
  return nil if n < 1
  n += sum_to(n - 1)
end

# Test Cases
p sum_to(5) == 15 # => returns 15
p sum_to(1) == 1 # => returns 1
p sum_to(9) == 45 # => returns 45
p sum_to(-8) == nil # => returns nil


#Write a function add_numbers(nums_array) that takes in an array of
#Fixnums and returns the sum of those numbers. Write this method recursively.
def add_numbers(array)
#add first in array to next in array. replace next in array
#until array.length < 1
  return array[0] if array.length <= 1
  num1, num2 = array.pop, array.pop
  sum = num1.to_i + num2.to_i
  array.unshift(sum)
  add_numbers(array)
end

# Test Cases
p add_numbers([1,2,3,4]) == 10 # => returns 10
p add_numbers([3]) == 3 # => returns 3
p add_numbers([-80,34,7]) == -39 # => returns -39
p add_numbers([]) == nil # => returns nil


#Let's write a method that will solve Gamma Function recursively.
#The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(num)

end

# Test Cases
gamma_fnc(0)  # => returns nil
gamma_fnc(1)  # => returns 1
gamma_fnc(4)  # => returns 6
gamma_fnc(8)  # => returns 5040
