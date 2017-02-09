require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return nil.hash if self.empty?
    result = 0
    self.each_with_index do |el, i|
      result += el.hash.to_i * i.hash
    end
    result
  end
end

class String
  def hash
    ords = self.chars.map { |el| el.ord }
    ords = ords.map.with_index { |el, i| el * i.hash }
    ords.reduce(:+)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += k.hash * v.hash
    end
    result
  end
end
