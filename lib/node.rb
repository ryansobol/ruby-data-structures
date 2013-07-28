class Node
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(value, prevv = nil, nexxt = nil)
    @value    = value
    self.prev = prevv
    self.next = nexxt
  end

  def next=(nexxt)
    unless nexxt.nil? || nexxt.is_a?(self.class)
      raise "next must be nil or a #{self.class} instance"
    end

    @next = nexxt
  end

  def prev=(prevv)
    unless prevv.nil? || prevv.is_a?(self.class)
      raise "prev must be nil or a #{self.class} instance"
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
