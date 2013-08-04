require "static_array/memory"

class StaticArray
  # O(1)
  def initialize(size)
    @data = Memory.new(size)
    @head = @data.head
    @word = @data.word
    @size = size
  end

  # O(1)
  attr_reader :size

  # O(1)
  attr_reader :data, :head, :word
  private :data, :head, :word

  # O(1)
  def [](index)
    if index < 0 || index >= size
      raise IndexError, "index #{index} out of bounds for #{self.class} of size #{size}"
    end

    data.get(index_2_address(index))
  end

  # O(1)
  def []=(index, value)
    if index < 0 || index >= size
      raise IndexError, "index #{index} out of bounds for #{self.class} of size #{size}"
    end

    data.set(index_2_address(index), value)
  end

  private

  # O(1)
  def index_2_address(index)
    head + index * word
  end
end
