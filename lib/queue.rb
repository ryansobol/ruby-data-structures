class Queue
  # O(1)
  def initialize
    @list = LinkedList.new
  end

  attr_reader :list
  private :list

  # O(1)
  def size
    list.size
  end

  # O(1)
  def empty?
    list.empty?
  end

  # O(1)
  def peek
    list.first
  end

  # O(1)
  def enqueue(value)
    list.push(value)
  end

  # O(1)
  def dequeue
    list.shift
  end
end
