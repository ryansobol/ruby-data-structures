class LinkedList
  class Node
    # O(1)
    def initialize(value, prevv = nil, nexxt = nil)
      @value    = value
      self.prev = prevv
      self.next = nexxt
    end

    # O(1)
    attr_accessor :value

    # O(1)
    attr_reader :prev, :next

    # O(1)
    def prev=(prevv)
      unless prevv.nil? || prevv.is_a?(self.class)
        raise "prev must be nil or a #{self.class} instance"
      end

      @prev = prevv
    end

    # O(1)
    def next=(nexxt)
      unless nexxt.nil? || nexxt.is_a?(self.class)
        raise "next must be nil or a #{self.class} instance"
      end

      @next = nexxt
    end

    # O(1)
    def clear
      temp = value
      self.value = self.prev = self.next = nil
      temp
    end

    # O(1)
    def ==(other)
      return false unless other
      self.value == other.value && self.prev == other.prev && self.next == other.next
    end
  end
end
