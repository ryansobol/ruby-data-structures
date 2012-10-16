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

    it "compares successfully" do
      subject.must_equal subject
      subject.must_equal Node.new(1, nil)

      subject.next = Node.new(2)
      subject.must_equal subject
      subject.must_equal Node.new(1, Node.new(2))
    end

    it "compares unsuccessfully" do
      subject.wont_equal nil
      subject.wont_equal Node.new(2, nil)
      subject.wont_equal Node.new(1, subject)

      subject.next = Node.new(2)
      subject.wont_equal nil
      subject.wont_equal Node.new(2, nil)
      subject.wont_equal Node.new(1, subject)
    end

    it "converts to a String" do
      subject.to_s.must_equal "1"
    end

    it "inspects itself" do
      subject.inspect.must_equal <<-EOS.chomp
#<#{subject.class}:#{subject.object_id} @value=#{subject.value.inspect}, @next=#{subject.next.inspect}>
EOS
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
