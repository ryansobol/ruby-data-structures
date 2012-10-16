class Node
  attr_accessor :value
  attr_reader :next

  def initialize(value, nexxt = nil)
    @value = value
    self.next = nexxt
  end

  def next=(nexxt)
    unless nexxt.nil? || nexxt.is_a?(Node)
      raise "Expected next to be nil or a Node object"
    end

    @next = nexxt
  end

  def ==(another)
    return false if another.nil?
    self.value == another.value && self.next == another.next
  end

  def to_s
    value.to_s
  end

  def inspect
    "#<#{self.class}:#{self.object_id} @value=#{self.value.inspect}, @next=#{self.next.inspect}>"
  end
end
