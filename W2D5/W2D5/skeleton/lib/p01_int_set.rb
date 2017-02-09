require 'byebug'

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max) { |el| el = false }
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @store.length)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % @store.length
    @store[i] << num
  end

  def remove(num)
    i = num % @store.length
    @store[i].each_index do |j|
      if @store[i][j] == num
        return @store[i].delete_at(j)
      end
    end
  end

  def include?(num)
    # debugger
    #mod by array length
    #call sub-aray, and iterate.
    #return true if we find the number, else false
    i = num % @store.length
    sub_array = @store[i]
    sub_array.each { |el| return true if el == num }
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % @store.length
    unless @store[i].include?(num)
      @store[i] << num
      @count += 1 
    end
    resize! if @count > @store.length
  end

  def remove(num)
    i = num % @store.length
    @store[i].each_index do |j|
      if @store[i][j] == num
        return @store[i].delete_at(j)
      end
    end
  end

  def include?(num)
    i = num % @store.length
    sub_array = @store[i]
    sub_array.each { |el| return true if el == num }
    false
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_self = Array.new(@store.length * 2) { Array.new }
    self.store.each do |el|
      el.each do |num|
        i = num % new_self.length
        new_self[i] << num
      end
    end
    @store = new_self
  end
end
