require "../../lib/node"
require "../test_helper"

describe Node do
  describe "given a Node with an integer value" do
    subject { Node.new(1) }

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

    it "sets prev with a Node object" do
      subject.prev = expected = Node.new(42)
      subject.prev.must_equal expected
    end

    it "sets prev with an invalid argument" do
      exception = proc { subject.prev = 42 }.must_raise(RuntimeError)
      exception.message.must_equal "Expected prev to be nil or a Node object"
    end

    it "sets next with a Node object" do
      subject.next = expected = Node.new(42)
      subject.next.must_equal expected
    end

    it "sets next with an invalid argument" do
      exception = proc { subject.next = 42 }.must_raise(RuntimeError)
      exception.message.must_equal "Expected next to be nil or a Node object"
    end

    it "clears" do
      subject.next = Node.new(42)
      subject.prev = Node.new(24)

      subject.clear.must_equal 1
      subject.value.must_be_nil
      subject.next.must_be_nil
      subject.prev.must_be_nil
    end

    it "compares successfully" do
      subject.must_equal subject
      subject.must_equal Node.new(1)

      subject.prev = Node.new(2)
      subject.must_equal subject
      subject.must_equal Node.new(1, Node.new(2))

      subject.next = Node.new(3)
      subject.must_equal subject
      subject.must_equal Node.new(1, Node.new(2), Node.new(3))
    end

    it "compares unsuccessfully" do
      subject.prev = Node.new(2)
      subject.next = Node.new(3)

      subject.wont_equal nil

      subject.wont_equal Node.new(4,    Node.new(2),  Node.new(4))
      subject.wont_equal Node.new(nil,  Node.new(2),  Node.new(4))

      subject.wont_equal Node.new(1,    Node.new(2),  Node.new(4))
      subject.wont_equal Node.new(1,    Node.new(2),  nil)

      subject.wont_equal Node.new(1,    Node.new(4),  Node.new(3))
      subject.wont_equal Node.new(1,    nil,          Node.new(3))
    end
  end

  #############################################################################

  describe "not given a Node" do
    it "initializes with an invalid prev" do
      exception = proc { Node.new(1, 2) }.must_raise(RuntimeError)
      exception.message.must_equal "Expected prev to be nil or a Node object"
    end

    it "initializes with an invalid next" do
      exception = proc { Node.new(1, nil, 3) }.must_raise(RuntimeError)
      exception.message.must_equal "Expected next to be nil or a Node object"
    end
  end
end
