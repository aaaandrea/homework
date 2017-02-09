class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []

    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        next if i == self.length - 1
        result << [i, j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    result = Array.new(self.length) { Array.new(self.length) }

    (0...self.length).each do |i|
      (0...self.length).each do |j|
        if self[i][j] == nil
          raise IndexError
        end
        result[i][j] = self[j][i]
      end
    end
    result
  end

  def stock_picker
    lowest_value = self[0]
    highest_value = self[-1]

    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
          lowest_value = i if lowest_value.nil? || self[i] < self[lowest_value] && i < highest_value
          highest_value = j if highest_value.nil? || self[j] > self[highest_value] && j > lowest_value
        j += 1
      end
      i += 1
    end
    [lowest_value, highest_value]
  end
end
