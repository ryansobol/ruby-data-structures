require "../../lib/linked_list"
require "../test_helper"

describe LinkedList do
  describe "given a empty LinkedList" do
    subject { LinkedList.new }

    it "has the correct size" do
      subject.size.must_equal 0
    end

    it "is empty" do
      subject.must_be_empty
    end

    it "has the correct first" do
      subject.first.must_be_nil
    end

    it "has the correct last" do
      subject.last.must_be_nil
    end

    it "shifts an item" do
      subject.shift(42).must_equal 1
      subject.size.must_equal 1
      subject.first.must_equal 42
      subject.last.must_equal 42
    end

    it "unshifts all items" do
      subject.unshift.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "pushes an item" do
      subject.push(42).must_equal 1
      subject.size.must_equal 1
      subject.first.must_equal 42
      subject.last.must_equal 42
    end

    it "pops all items" do
      subject.pop.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal []
    end

    it "gets the value at index -1" do
      subject[-1].must_be_nil
    end

    it "gets the value at index 0" do
      subject[0].must_be_nil
    end

    it "gets the value at index 1" do
      subject[1].must_be_nil
    end

    it "gets the value at index 2" do
      subject[2].must_be_nil
    end

    it "sets the value at index -1" do
      subject[-1] = 42
      subject[-1].must_be_nil
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_be_nil
    end

    it "sets the value at index 1" do
      subject[1] = 42
      subject[1].must_be_nil
    end

    it "sets the value at index 2" do
      subject[2] = 42
      subject[2].must_be_nil
    end

    it "converts to an Array" do
      subject.to_a.must_equal []
    end

    it "converts to a String" do
      subject.to_s.must_equal "()"
    end
  end

  #############################################################################

  describe "given a LinkedList with 1 item" do
    subject { LinkedList.new("R") }

    it "has the correct size" do
      subject.size.must_equal 1
    end

    it "is not empty" do
      subject.wont_be_empty
    end

    it "has the correct first" do
      subject.first.must_equal "R"
    end

    it "has the correct last" do
      subject.last.must_equal "R"
    end

    it "shifts an item" do
      subject.shift(42).must_equal 2
      subject.size.must_equal 2
      subject.first.must_equal 42
      subject.last.must_equal "R"
    end

    it "unshifts all items" do
      subject.unshift.must_equal "R"
      subject.unshift.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "pushes an item" do
      subject.push(42).must_equal 2
      subject.size.must_equal 2
      subject.first.must_equal "R"
      subject.last.must_equal 42
    end

    it "pops all items" do
      subject.pop.must_equal "R"
      subject.pop.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal "R"
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal ["R"]
    end

    it "gets the value at index -1" do
      subject[-1].must_be_nil
    end

    it "gets the value at index 0" do
      subject[0].must_equal "R"
    end

    it "gets the value at index 1" do
      subject[1].must_be_nil
    end

    it "gets the value at index 2" do
      subject[2].must_be_nil
    end

    it "sets the value at index -1" do
      subject[-1] = 42
      subject[-1].must_be_nil
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
    end

    it "sets the value at index 1" do
      subject[1] = 42
      subject[1].must_be_nil
    end

    it "sets the value at index 2" do
      subject[2] = 42
      subject[2].must_be_nil
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R"]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R")'
    end
  end

  #############################################################################

  describe "given a LinkedList with 2 items" do
    subject { LinkedList.new("R", :S) }

    it "has the correct size" do
      subject.size.must_equal 2
    end

    it "is not empty" do
      subject.wont_be_empty
    end

    it "has the correct first" do
      subject.first.must_equal "R"
    end

    it "has the correct last" do
      subject.last.must_equal :S
    end

    it "shifts an item" do
      subject.shift(42).must_equal 3
      subject.size.must_equal 3
      subject.first.must_equal 42
      subject.last.must_equal :S
    end

    it "unshifts all items" do
      subject.unshift.must_equal "R"
      subject.unshift.must_equal :S
      subject.unshift.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "pushes an item" do
      subject.push(42).must_equal 3
      subject.size.must_equal 3
      subject.first.must_equal "R"
      subject.last.must_equal 42
    end

    it "pops all items" do
      subject.pop.must_equal :S
      subject.pop.must_equal "R"
      subject.pop.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal "R"
      enumerator.next.must_equal :S
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal ["R", :S]
    end

    it "gets the value at index -1" do
      subject[-1].must_be_nil
    end

    it "gets the value at index 0" do
      subject[0].must_equal "R"
    end

    it "gets the value at index 1" do
      subject[1].must_equal :S
    end

    it "gets the value at index 2" do
      subject[2].must_be_nil
    end

    it "sets the value at index -1" do
      subject[-1] = 42
      subject[-1].must_be_nil
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
    end

    it "sets the value at index 1" do
      subject[1] = 42
      subject[1].must_equal 42
    end

    it "sets the value at index 2" do
      subject[2] = 42
      subject[2].must_be_nil
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R", :S]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R", :S)'
    end
  end

  #############################################################################

  describe "given a LinkedList with 3 items" do
    subject { LinkedList.new("R", :S, 31) }

    it "has the correct size" do
      subject.size.must_equal 3
    end

    it "is not empty" do
      subject.wont_be_empty
    end

    it "has the correct first" do
      subject.first.must_equal "R"
    end

    it "has the correct last" do
      subject.last.must_equal 31
    end

    it "shifts an item" do
      subject.shift(42).must_equal 4
      subject.size.must_equal 4
      subject.first.must_equal 42
      subject.last.must_equal 31
    end

    it "unshifts all items" do
      subject.unshift.must_equal "R"
      subject.unshift.must_equal :S
      subject.unshift.must_equal 31
      subject.unshift.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "pushes an item" do
      subject.push(42).must_equal 4
      subject.size.must_equal 4
      subject.first.must_equal "R"
      subject.last.must_equal 42
    end

    it "pops all items" do
      subject.pop.must_equal 31
      subject.pop.must_equal :S
      subject.pop.must_equal "R"
      subject.pop.must_be_nil
      subject.size.must_equal 0

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal "R"
      enumerator.next.must_equal :S
      enumerator.next.must_equal 31
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal ["R", :S, 31]
    end

    it "gets the value at index -1" do
      subject[-1].must_be_nil
    end

    it "gets the value at index 0" do
      subject[0].must_equal "R"
    end

    it "gets the value at index 1" do
      subject[1].must_equal :S
    end

    it "gets the value at index 2" do
      subject[2].must_equal 31
    end

    it "sets the value at index -1" do
      subject[-1] = 42
      subject[-1].must_be_nil
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
    end

    it "sets the value at index 1" do
      subject[1] = 42
      subject[1].must_equal 42
    end

    it "sets the value at index 2" do
      subject[2] = 42
      subject[2].must_equal 42
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R", :S, 31]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R", :S, 31)'
    end
  end
end
