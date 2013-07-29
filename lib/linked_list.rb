require_relative "linked_list/node"

class LinkedList
  include Enumerable

  # O(n)
  def initialize(*items)
    @size = 0
    items.each { |item| push(item) }
  end

  #################################################################################################

  # O(1)
  attr_reader :size

  # O(1)
  attr_reader :head, :tail
  protected :head, :tail

  #################################################################################################

  # O(1)
  def empty?
    head.nil?
  end

  # O(1)
  def first
    empty? ? nil : head.value
  end

  # O(1)
  def last
    empty? ? nil : tail.value
  end

  #################################################################################################

  # O(1)
  def shift(value)
    @size += 1
    @head = Node.new(value, nil, head)

    if size == 1
      @tail = head
    else
      head.next.prev = head
    end

    size
  end

  # O(1)
  def unshift
    return nil if empty?

    @size -= 1

    temp  = head
    @head = temp.next

    if size == 0
      @tail = nil
    else
      head.prev = nil
    end

    temp.clear
  end

  #################################################################################################

  # O(1)
  def push(value)
    @size += 1

    @tail = Node.new(value, tail)

    if size == 1
      @head = tail
    else
      tail.prev.next = tail
    end

    size
  end

  # O(1)
  def pop
    return nil if empty?

    @size -= 1

    temp  = tail
    @tail = temp.prev

    if size == 0
      @head = nil
    else
      tail.next = nil
    end

    temp.clear
  end

  #################################################################################################

  # O(n)
  def clear
    current = head

    while current
      nexxt = current.next
      current.clear
      current = nexxt
    end

    @head = @tail = nil
    @size = 0
  end

  #################################################################################################

  # O(n)
  def to_a
    map { |value| value }
  end

  # O(n)
  def to_s
    stop      = size - 1
    output    = ""
    seperator = ", "

    each_with_index do |value, index|
      output << value.inspect
      output << seperator unless index == stop
    end

    "(#{output})"
  end

  #################################################################################################

  # O(n)
  def each_node
    current = head

    while current
      yield current

      current = current.next
    end
  end
  protected :each_node

  # O(n)
  def each_node_with_index
    current = head
    index   = 0

    while current
      yield current, index

      current = current.next
      index   += 1
    end
  end
  protected :each_node_with_index

  #################################################################################################

  # O(n)
  def each
    return to_enum(:each) unless block_given?

    each_node { |node| yield node.value }
  end

  # O(n)
  def index(value)
    each_node_with_index { |node, index| return index if node.value == value }
  end

  # O(n)
  def [](key)
    return if key < 0 || key >= size

    each_with_index { |value, index| return value if key == index }
  end

  # O(n)
  def []=(key, value)
    return if key < 0 || key >= size

    node = each_node_with_index do |node, index|
      break node if key == index
    end

    node.value = value
  end

  #################################################################################################

  # O(n)
  def insert(key, value)
    return nil          if key < 0 || key > size
    return push(value)  if key == size
    return shift(value) if key == 0

    nexxt = each_node_with_index { |node, index| break node if key == index }
    prevv = nexxt.prev

    prevv.next = nexxt.prev = LinkedList::Node.new(value, prevv, nexxt)

    @size += 1
  end

  # O(n)
  def delete(key)
    return nil      if key < 0 || key > size - 1
    return pop      if key == size - 1
    return unshift  if key == 0

    @size -= 1

    middle = each_node_with_index { |node, index| break node if key == index }

    prevv = middle.prev
    nexxt = middle.next

    prevv.next = nexxt
    nexxt.prev = prevv

    middle.clear
  end
end
