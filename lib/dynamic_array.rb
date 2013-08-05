require "static_array"

class DynamicArray
  CAPACTIY = 4

  def initialize(size = 0)
    @size = size
    size2 = size * 2
    @data = StaticArray.new(size2 > CAPACTIY ? size2 : CAPACTIY)
  end

  #################################################################################################

  attr_reader :size

  attr_reader :data
  private :data

  def capacity
    data.size
  end

  #################################################################################################

  def resize(new_capacity)
    new_data = StaticArray.new(new_capacity)

    stop = new_capacity > capacity ? capacity : new_capacity

    for i in 0...stop do
      new_data[i] = data[i]
    end

    @data = new_data
  end

  private :resize

  #################################################################################################

  def []=(index, value)
    if index + size < 0
      raise IndexError, "index #{index} too small for #{self.class} of size #{size}"
    end

    if index < 0
      index += size
    elsif index >= size
      @size = index + 1

      resize(size * 2) if size > capacity
    end

    data[index] = value
  end

  def [](index)
    return nil if index + size < 0 || index >= size

    index += size if index < 0

    data[index]
  end

  #################################################################################################

  def push(value)
    resize((size + 1) * 2) if size == capacity
    data[size] = value
    @size += 1
    value
  end

  def pop
    @size -= 1
    temp = data[size]
    data[size] = nil
    new_capacity = capacity / 4.0
    resize(size * 2) if capacity / 4.0 > size && capacty > CAPACTIY
    temp
  end

  #################################################################################################

  def shift(value)
  end

  def unshift
  end
end
