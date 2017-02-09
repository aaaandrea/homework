require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    i = key.hash % @store.length
    unless @store[i].include?(key)
      @store[i] << key
      @count += 1
      resize! if @count > @store.length
    end
  end

  def include?(key)
    i = key.hash % @store.length
    @store[i].include?(key)
  end

  def remove(key)
    i = key.hash % @store.length
    @store[i].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(@count) { Array.new }

    i = 1
    @store.each do |el|
      i = el.hash % new_array.length
      unless new_array[i].include?(el)
        new_array[i] << el
      end
    end

    @count = new_array.length
    @store = new_array
  end

end
