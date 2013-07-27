class Node
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(value, prev = nil, nexxt = nil)
    @value = value
    self.prev = prev
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

  def ==(another)
    return false unless another
    self.value == another.value && self.prev == another.prev && self.next == another.next
  end

  def to_s
    return "(#{value})" unless self.next
    "(#{value} #{self.next})"
  end
end
