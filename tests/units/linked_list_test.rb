require_relative "../test_helper"
require "linked_list"

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

    it "clears" do
      subject.clear.must_equal 0
      subject.size.must_equal 0
      subject.first.must_be_nil
      subject.last.must_be_nil

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an Array" do
      subject.to_a.must_equal []
    end

    it "converts to a String" do
      subject.to_s.must_equal "()"
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal []
    end

    it "has the correct index for value 'R'" do
      subject.index("R").must_be_nil
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 0"
    end

    it "gets the value at index 0" do
      exception = proc { subject[0] }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for LinkedList of size 0"
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 0"
    end

    it "sets the value at index 0" do
      exception = proc { subject[0] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for LinkedList of size 0"
    end

    it "inserts a value at index -1" do
      exception = proc { subject.insert(-1, 42) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 0"

      subject.to_a.must_equal []
    end

    it "inserts a value at index 0" do
      subject.insert(0, 42).must_equal 1
      subject.size.must_equal 1
      subject[0].must_equal 42
      subject.to_a.must_equal [42]
    end

    it "inserts a value at index 1" do
      exception = proc { subject.insert(1, 42) }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for LinkedList of size 0"

      subject.to_a.must_equal []
    end

    it "deletes the value at index -1" do
      exception = proc { subject.delete(-1) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 0"

      subject.to_a.must_equal []

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "deletes the value at index 0" do
      exception = proc { subject.delete(0) }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for LinkedList of size 0"

      subject.to_a.must_equal []

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
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

    it "clears" do
      subject.clear.must_equal 0
      subject.size.must_equal 0
      subject.first.must_be_nil
      subject.last.must_be_nil

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R"]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R")'
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal "R"
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each value" do
      subject.map { |value| value }.must_equal ["R"]
    end

    it "has the correct index for value 'R'" do
      subject.index("R").must_equal 0
    end

    it "has the correct index for value :S" do
      subject.index(:S).must_be_nil
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 1"
    end

    it "gets the value at index 0" do
      subject[0].must_equal "R"
    end

    it "gets the value at index 1" do
      exception = proc { subject[1] }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for LinkedList of size 1"
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 1"
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
    end

    it "sets the value at index 1" do
      exception = proc { subject[1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for LinkedList of size 1"
    end

    it "inserts a value at index -1" do
      exception = proc { subject.insert(-1, 42) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 1"

      subject.to_a.must_equal ["R"]
    end

    it "inserts a value at index 0" do
      subject.insert(0, 42).must_equal 2
      subject.size.must_equal 2
      subject[0].must_equal 42
      subject.to_a.must_equal [42, "R"]
    end

    it "inserts a value at index 1" do
      subject.insert(1, 42).must_equal 2
      subject.size.must_equal 2
      subject[1].must_equal 42
      subject.to_a.must_equal ["R", 42]
    end

    it "inserts a value at index 2" do
      exception = proc { subject.insert(2, 42) }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for LinkedList of size 1"

      subject.to_a.must_equal ["R"]
    end

    it "deletes the value at index -1" do
      exception = proc { subject.delete(-1) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 1"

      subject.to_a.must_equal ["R"]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 1
    end

    it "deletes the value at index 0" do
      subject.delete(0).must_equal "R"
      subject.size.must_equal 0

      exception = proc { subject[0] }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for LinkedList of size 0"

      subject.to_a.must_equal []

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "deletes the value at index 1" do
      exception = proc { subject.delete(1) }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for LinkedList of size 1"

      subject.to_a.must_equal ["R"]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 1
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

    it "clears" do
      subject.clear.must_equal 0
      subject.size.must_equal 0
      subject.first.must_be_nil
      subject.last.must_be_nil

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R", :S]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R", :S)'
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

    it "has the correct index for value 'R'" do
      subject.index("R").must_equal 0
    end

    it "has the correct index for value :S" do
      subject.index(:S).must_equal 1
    end

    it "has the correct index for value 31" do
      subject.index(31).must_be_nil
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 2"
    end

    it "gets the value at index 0" do
      subject[0].must_equal "R"
    end

    it "gets the value at index 1" do
      subject[1].must_equal :S
    end

    it "gets the value at index 2" do
      exception = proc { subject[2] }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for LinkedList of size 2"
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 2"
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
      exception = proc { subject[2] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for LinkedList of size 2"
    end

    it "inserts a value at index -1" do
      exception = proc { subject.insert(-1, 42) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 2"

      subject.to_a.must_equal ["R", :S]
    end

    it "inserts a value at index 0" do
      subject.insert(0, 42).must_equal 3
      subject.size.must_equal 3
      subject[0].must_equal 42
      subject.to_a.must_equal [42, "R", :S]
    end

    it "inserts a value at index 1" do
      subject.insert(1, 42).must_equal 3
      subject.size.must_equal 3
      subject[1].must_equal 42
      subject.to_a.must_equal ["R", 42, :S]
    end

    it "inserts a value at index 2" do
      subject.insert(2, 42).must_equal 3
      subject.size.must_equal 3
      subject[2].must_equal 42
      subject.to_a.must_equal ["R", :S, 42]
    end

    it "inserts a value at index 3" do
      exception = proc { subject.insert(3, 42) }.must_raise(IndexError)
      exception.message.must_equal "index 3 out of bounds for LinkedList of size 2"

      subject.to_a.must_equal ["R", :S]
    end

    it "deletes the value at index -1" do
      exception = proc { subject.delete(-1) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 2"

      subject.to_a.must_equal ["R", :S]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 2
    end

    it "deletes the value at index 0" do
      subject.delete(0).must_equal "R"
      subject.size.must_equal 1
      subject[0].must_equal :S
      subject.to_a.must_equal [:S]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 1
    end

    it "deletes the value at index 1" do
      subject.delete(1).must_equal :S
      subject.size.must_equal 1

      exception = proc { subject[1] }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for LinkedList of size 1"

      subject.to_a.must_equal ["R"]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 1
    end

    it "deletes the value at index 2" do
      exception = proc { subject.delete(2) }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for LinkedList of size 2"

      subject.to_a.must_equal ["R", :S]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 2
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

    it "clears" do
      subject.clear.must_equal 0
      subject.size.must_equal 0
      subject.first.must_be_nil
      subject.last.must_be_nil

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 0
    end

    it "converts to an Array" do
      subject.to_a.must_equal ["R", :S, 31]
    end

    it "converts to a String" do
      subject.to_s.must_equal '("R", :S, 31)'
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

    it "has the correct index for value 'R'" do
      subject.index("R").must_equal 0
    end

    it "has the correct index for value :S" do
      subject.index(:S).must_equal 1
    end

    it "has the correct index for value 31" do
      subject.index(31).must_equal 2
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 3"
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
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 3"
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

    it "inserts a value at index -1" do
      exception = proc { subject.insert(-1, 42) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 3"

      subject.to_a.must_equal ["R", :S, 31]
    end

    it "inserts a value at index 0" do
      subject.insert(0, 42).must_equal 4
      subject.size.must_equal 4
      subject[0].must_equal 42
      subject.to_a.must_equal [42, "R", :S, 31]
    end

    it "inserts a value at index 1" do
      subject.insert(1, 42).must_equal 4
      subject.size.must_equal 4
      subject[1].must_equal 42
      subject.to_a.must_equal ["R", 42, :S, 31]
    end

    it "inserts a value at index 2" do
      subject.insert(2, 42).must_equal 4
      subject.size.must_equal 4
      subject[2].must_equal 42
      subject.to_a.must_equal ["R", :S, 42, 31]
    end

    it "inserts a value at index 3" do
      subject.insert(3, 42).must_equal 4
      subject.size.must_equal 4
      subject[3].must_equal 42
      subject.to_a.must_equal ["R", :S, 31, 42]
    end

    it "deletes the value at index -1" do
      exception = proc { subject.delete(-1) }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for LinkedList of size 3"

      subject.to_a.must_equal ["R", :S, 31]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 3
    end

    it "deletes the value at index 0" do
      subject.delete(0).must_equal "R"
      subject.size.must_equal 2
      subject[0].must_equal :S
      subject.to_a.must_equal [:S, 31]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 2
    end

    it "deletes the value at index 1" do
      subject.delete(1).must_equal :S
      subject.size.must_equal 2
      subject[1].must_equal 31
      subject.to_a.must_equal ["R", 31]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 2
    end

    it "deletes the value at index 2" do
      subject.delete(2).must_equal 31
      subject.size.must_equal 2

      exception = proc { subject[2] }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for LinkedList of size 2"

      subject.to_a.must_equal ["R", :S]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 2
    end

    it "deletes the value at index 3" do
      exception = proc { subject.delete(3) }.must_raise(IndexError)
      exception.message.must_equal "index 3 out of bounds for LinkedList of size 3"

      subject.to_a.must_equal ["R", :S, 31]

      GC.start
      ObjectSpace.each_object(LinkedList::Node).count.must_equal 3
    end
  end
end
