def range(start, finish)
  result = [start + 1]
  return [] if finish < start
  return result if result.last == finish - 1
  result << range(result.last, finish)
  result.flatten
end

def sum_array_it(array)
  array.reduce(:+)
end

def sum_array_rec(array)
  return array[0].to_i if array.length <= 1
  array.shift + sum_array_rec(array)
end

def exp_one(base, exp)
  return 1 if exp == 0
  base * exp_one(base, exp - 1)
end

def exp_two(base, exp)
  return 1 if exp == 0
  return base if exp == 1

  return exp_two(base, exp/2) ** 2 if exp % 2 == 0
  base * exp_two(base, (exp - 1)/2) ** 2 if exp % 2 > 0
end

def deep_dup(array)
  new_array = []
  array.each do |el|
    unless el.is_a?(Array)
      new_array << el
    else
      new_array << deep_dup(el)
    end
  end
  new_array
end

def fib_rec(n)
  return 1 if n == 1
  return 1 if n == 2
  fib(n - 1) + fib(n - 2)
end

def fib_it(n)
  working_array = [1, 1]
  until working_array.length == n
    working_array << working_array[-2..-1].reduce(:+)
  end
  working_array.last
end

class Array
  def subsets
    results = []
    return [] if self.empty?
    return [[], self] if self.length == 1
    most_subs = self[0...-1].subsets.each { |el| el << self[-1]}
    self[0...-1].subsets + most_subs
  end
end

def permutations(array)
  result =[]
  return array if array.length == 1
  array.length.times do
    permutations(array[1..-1]).each do |arr|
      result << ([array.first] + [arr]).flatten
    end
    el = array.shift
    array.push(el)
  end

  result
end

def bsearch(array, target)
  count = 0
  middle_idx = array.length / 2
  middle_item = array[middle_idx]

  return nil if array.length == 1 && target != array[0]
  return middle_idx if target == middle_item

  if target > middle_item
    subarray = array[(middle_idx)..-1]
    count = middle_idx
  else
    subarray = array[0..middle_idx]
  end

  result = bsearch(subarray, target)
  return count += result if result != nil
  nil
end

def merge_sort(arr)
  return arr if arr.length == 1
  mid = arr.length / 2
  merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
end

def merge(arr, last_arr)
  result = []
  until arr.empty? && last_arr.empty?
    if arr.empty?
      result << last_arr.shift
    elsif last_arr.empty?
      result << arr.shift
    elsif arr.first > last_arr.first
      result << last_arr.shift
    else
      result << arr.shift
    end
  end
  result
end

def greedy_make_change(amount, denoms)
  running_total = 0
  results = []
  return 0 if denoms.empty?

  denoms.sort.reverse.each do |coin|
    unless amount < coin
      until amount - running_total < coin
        running_total += coin
        results << coin
      end

      greedy_make_change((amount - running_total), denoms[1..-1])
    end

  end

  results.flatten
end

# def make_better_change(amount, denoms)
#   running_total = 0
#   results = []
#   return 0 if denoms.empty?
#
#   denoms.sort.reverse.each_with_index do |coin, idx|
#     unless (amount % coin) == 0
#       next if greedy_make_change(amount, denoms).length > greedy_make_change(amount, denoms[1..-1]).length
#     end
#
#
#     unless amount < coin
#       until amount - running_total < coin
#         running_total += coin
#         results << coin
#       end
#
#       make_better_change((amount - running_total), denoms[1..-1])
#     end
#
#   end
#
#   results.flatten
# end

def make_better_change(amount, denoms)
  return greedy_make_change(amount, denoms) if greedy_make_change(amount, denoms).length < greedy_make_change(amount, denoms[1..-1]).length
  make_better_change(amount, denoms[1..-1])
end
