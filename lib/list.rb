require_relative "node"

class List
  include Enumerable

  def initialize(*items)
    items.reverse.each { |item| shift(item) }
  end

  attr_reader :head
  protected :head

  def empty?
    head.nil?
  end

  def first
    empty? ? nil : head.value
  end

  def next
    empty? ? nil : head.next
  end
  protected :next

  def size
    @size || 0
  end

  def shift(item)
    @head = Node.new(item, head)
    @size = size + 1
  end

  def unshift
    temp = first
    @head = self.next
    temp
  end

  def to_s
    return "(#{first})" if self.next.nil?
    "(#{first} #{self.next})"
  end

  def inspect
    "#<#{self.class}:#{self.object_id} @size=#{self.size}, @head=#{self.head.inspect}, @next=#{self.next.inspect}>"
  end

  def each_node
    current = head
    while current
      yield current
      current = current.next
    end
  end
  protected :each_node

  def each
    return to_enum(:each) unless block_given?
    each_node { |node| yield node.value }
  end

  def [](key)
    return nil if key >= size
    each_with_index { |value, index| return value if key == index }
    nil
  end

  # TODO: See Array#[]=
  # def []=(key, value)
  # end

  # TODO: Use an instance variable similar to @head
  def tail
    each_node { |node| return node if node.next.nil? }
  end
  protected :tail

  def last
    empty? ? nil : tail.value
  end

  def push(item)
    return shift(item) if empty?
    tail.next = Node.new(item)
    return @size = size + 1
  end

  # TODO: See #unshift
  # def pop
  # end
end
