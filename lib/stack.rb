class Stack
  # O(1)
  def initialize
    @data = []
    @size = 0
  end

  # O(1)
  attr_reader :data
  private :data

  # O(1)
  attr_reader :size

  # O(1)
  def empty?
    size.zero?
  end

  # O(1)
  def peek
    data[size]
  end

  # O(1)
  def push(value)
    data[size] = value
    @size += 1
    value
  end

  # O(1)
  def pop
    @size -= 1
    temp = data[size]
    data[size] = nil
    temp
  end
end
