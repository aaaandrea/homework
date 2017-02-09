require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    return if self.empty?
    link = first
    while true
      if link.next = @tail && link.key != key
        result = nil
        break
      elsif link.key == key
        result = link.val
        break
      end
      link = link.next
    end
    result
  end

  def include?(key)
  end

  def append(key, val)
    link = @head
    if empty?
      self.insert_link(key, val, link, link.next)
    else
      while true
        break if link.next == @tail || val < link.next.val
        link = link.next
      end
    end
    self.insert_link(key, val, link, link.next)
  end

  def insert_link(key, val, prev_link, next_link)
    # debugger
    new_link = Link.new(key, val)

    prev_link.next = new_link
    new_link.prev = prev_link

    next_link.prev = new_link
    new_link.next = next_link

    new_link
  end

  def update(key, val)
    return if self.empty?
    link = first
    while true
      break if link.key == key
      link = link.next
    end
    first
    link.val = val
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
