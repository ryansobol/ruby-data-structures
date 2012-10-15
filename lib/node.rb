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
end
