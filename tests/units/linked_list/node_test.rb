require_relative "../../test_helper"
require "linked_list/node"

describe LinkedList::Node do
  describe "given a LinkedList::Node with an integer value" do
    subject { LinkedList::Node.new(1) }

    it "reads value" do
      subject.value.must_equal 1
    end

    it "reads prev" do
      subject.prev.must_be_nil
    end

    it "reads next" do
      subject.next.must_be_nil
    end

    it "sets value" do
      subject.value = 42
      subject.value.must_equal 42
    end

    it "sets prev with a LinkedList::Node object" do
      subject.prev = expected = LinkedList::Node.new(42)
      subject.prev.must_equal expected
    end

    it "sets prev with an invalid argument" do
      exception = proc { subject.prev = 42 }.must_raise(RuntimeError)
      exception.message.must_equal "prev must be nil or a LinkedList::Node instance"
    end

    it "sets next with a LinkedList::Node object" do
      subject.next = expected = LinkedList::Node.new(42)
      subject.next.must_equal expected
    end

    it "sets next with an invalid argument" do
      exception = proc { subject.next = 42 }.must_raise(RuntimeError)
      exception.message.must_equal "next must be nil or a LinkedList::Node instance"
    end

    it "clears" do
      subject.next = LinkedList::Node.new(42)
      subject.prev = LinkedList::Node.new(24)

      subject.clear.must_equal 1
      subject.value.must_be_nil
      subject.next.must_be_nil
      subject.prev.must_be_nil
    end

    it "compares successfully" do
      subject.must_equal subject
      subject.must_equal LinkedList::Node.new(1)

      subject.prev = LinkedList::Node.new(2)
      subject.must_equal subject
      subject.must_equal LinkedList::Node.new(1, LinkedList::Node.new(2))

      subject.next = LinkedList::Node.new(3)
      subject.must_equal subject
      subject.must_equal LinkedList::Node.new(1, LinkedList::Node.new(2), LinkedList::Node.new(3))
    end

    it "compares unsuccessfully" do
      subject.prev = LinkedList::Node.new(2)
      subject.next = LinkedList::Node.new(3)

      subject.wont_equal nil

      subject.wont_equal LinkedList::Node.new(4,    LinkedList::Node.new(2),  LinkedList::Node.new(4))
      subject.wont_equal LinkedList::Node.new(nil,  LinkedList::Node.new(2),  LinkedList::Node.new(4))

      subject.wont_equal LinkedList::Node.new(1,    LinkedList::Node.new(2),  LinkedList::Node.new(4))
      subject.wont_equal LinkedList::Node.new(1,    LinkedList::Node.new(2),  nil)

      subject.wont_equal LinkedList::Node.new(1,    LinkedList::Node.new(4),  LinkedList::Node.new(3))
      subject.wont_equal LinkedList::Node.new(1,    nil,          LinkedList::Node.new(3))
    end
  end

  #############################################################################

  describe "not given a LinkedList::Node" do
    it "initializes with an invalid prev" do
      exception = proc { LinkedList::Node.new(1, 2) }.must_raise(RuntimeError)
      exception.message.must_equal "prev must be nil or a LinkedList::Node instance"
    end

    it "initializes with an invalid next" do
      exception = proc { LinkedList::Node.new(1, nil, 3) }.must_raise(RuntimeError)
      exception.message.must_equal "next must be nil or a LinkedList::Node instance"
    end
  end
end
