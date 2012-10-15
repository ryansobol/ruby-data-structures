require "../../lib/node"
require "../test_helper"

describe Node do
  describe "given a Node with an integer value and a nil next" do
    subject { Node.new(1, nil) }

    it "reads value" do
      subject.value.must_equal 1
    end

    it "reads next" do
      subject.next.must_be_nil
    end

    it "sets value" do
      subject.value = 42
      subject.value.must_equal 42
    end

    it "sets next with a Node object" do
      subject.next = expected = Node.new(42, nil)
      subject.next.must_equal expected
    end

    it "sets next with an invalid argument" do
      exception = proc { subject.next = 2 }.must_raise(RuntimeError)
      exception.message.must_equal "Expected next to be nil or a Node object"
    end
  end

  #############################################################################

  describe "not given a Node" do
    it "initializes with an invalid next" do
      exception = proc { Node.new(1, 2) }.must_raise(RuntimeError)
      exception.message.must_equal "Expected next to be nil or a Node object"
    end

    it "initializes with no next" do
      node = Node.new(1)
      node.next.must_be_nil
    end
  end
end
