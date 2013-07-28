class Node
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(value, prevv = nil, nexxt = nil)
    @value    = value
    self.prev = prevv
    self.next = nexxt
  end

  def next=(nexxt)
    unless nexxt.nil? || nexxt.is_a?(Node)
      raise "Expected next to be nil or a Node object"
    end

    @next = nexxt
  end

  def prev=(prevv)
    unless prevv.nil? || prevv.is_a?(Node)
      raise "Expected prev to be nil or a Node object"
    end

    @prev = prevv
  end

  def clear
    temp = value
    self.value = self.next = self.prev = nil
    temp
  end

  def ==(other)
    return false unless other
    self.value == other.value && self.prev == other.prev && self.next == other.next
  end
end
