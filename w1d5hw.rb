class Stack #LIFO
  def initialize(main)
    # create ivar to store stack here!
    @main = main
  end

  def add(el)
    # adds an element to the stack
    self << el
  end

  def remove
    # removes one element from the stack
    self -= self.last
  end

  def show
    # return a copy of the stack
    self.dup
  end
end

class Queue
  def initialize(main)
    @main = main
  end

  def enqueue(el)
    self.unshift(el)
  end

  def dequeue
    self.shift
  end

  def show
    self.dup
  end
end

class Map
  def initialize(main)
    @main = main
  end

  def assign(key, value)

  end

  def lookup(key, value)
    [key, value]
  end

  def remove(key)
    key.last.delete
  end

  def show
    p self
  end
end
