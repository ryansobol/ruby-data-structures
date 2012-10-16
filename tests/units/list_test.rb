require "../../lib/list"
require "../test_helper"

describe List do
  describe "given a empty List" do
    subject { List.new }

    it "is empty" do
      subject.must_be_empty
    end

    it "reads first" do
      subject.first.must_be_nil
    end

    it "reads size" do
      subject.size.must_equal 0
    end

    it "shifts an item" do
      subject.shift(1).must_equal 1
      subject.size.must_equal 1
    end

    it "unshifts all items" do
      subject.unshift.must_be_nil
    end

    it "converts to a String" do
      subject.to_s.must_equal "()"
    end

    it "inspects itself" do
      subject.inspect.must_equal <<-EOS.chomp
#<#{subject.class}:#{subject.object_id} @size=#{subject.size}, @head=#{subject.send(:head).inspect}, @next=#{subject.send(:next).inspect}>
EOS
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each item" do
      subject.map { |node| node }.must_equal []
    end

    it "gets index 0" do
      subject[0].must_be_nil
    end

    it "gets index 1" do
      subject[1].must_be_nil
    end

    it "gets index 2" do
      subject[2].must_be_nil
    end

    it "reads last" do
      subject.last.must_be_nil
    end

    it "pushes an item" do
      subject.push(42).must_equal 1
      subject.size.must_equal 1
      subject.last.must_equal 42
    end
  end

  #############################################################################

  describe "given a List with 1 item" do
    subject { List.new(1) }

    it "is not empty" do
      subject.wont_be_empty
    end

    it "reads first" do
      subject.first.must_equal 1
    end

    it "reads size" do
      subject.size.must_equal 1
    end

    it "shifts an item" do
      subject.shift(2).must_equal 2
      subject.size.must_equal 2
    end

    it "unshifts all items" do
      subject.unshift.must_equal 1
      subject.unshift.must_be_nil
    end

    it "converts to a String" do
      subject.to_s.must_equal "(1)"
    end

    it "inspects itself" do
      subject.inspect.must_equal <<-EOS.chomp
#<#{subject.class}:#{subject.object_id} @size=#{subject.size}, @head=#{subject.send(:head).inspect}, @next=#{subject.send(:next).inspect}>
EOS
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal 1
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each item" do
      subject.map { |node| node }.must_equal [1]
    end

    it "gets index 0" do
      subject[0].must_equal 1
    end

    it "gets index 1" do
      subject[1].must_be_nil
    end

    it "gets index 2" do
      subject[2].must_be_nil
    end

    it "reads last" do
      subject.last.must_equal 1
    end

    it "pushes an item" do
      subject.push(42).must_equal 2
      subject.size.must_equal 2
      subject.last.must_equal 42
    end
  end

  #############################################################################

  describe "given a List with 2 items" do
    subject { List.new(1, 2) }

    it "is not empty" do
      subject.wont_be_empty
    end

    it "reads first" do
      subject.first.must_equal 1
    end

    it "reads size" do
      subject.size.must_equal 2
    end

    it "shifts an item" do
      subject.shift(3).must_equal 3
      subject.size.must_equal 3
    end

    it "unshifts all items" do
      subject.unshift.must_equal 1
      subject.unshift.must_equal 2
      subject.unshift.must_be_nil
    end

    it "converts to a String" do
      subject.to_s.must_equal "(1 (2))"
    end

    it "inspects itself" do
      subject.inspect.must_equal <<-EOS.chomp
#<#{subject.class}:#{subject.object_id} @size=#{subject.size}, @head=#{subject.send(:head).inspect}, @next=#{subject.send(:next).inspect}>
EOS
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal 1
      enumerator.next.must_equal 2
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each node" do
      subject.map { |node| node }.must_equal [1, 2]
    end

    it "gets index 0" do
      subject[0].must_equal 1
    end

    it "gets index 1" do
      subject[1].must_equal 2
    end

    it "gets index 2" do
      subject[2].must_be_nil
    end

    it "reads last" do
      subject.last.must_equal 2
    end

    it "pushes an item" do
      subject.push(42).must_equal 3
      subject.size.must_equal 3
      subject.last.must_equal 42
    end
  end

  #############################################################################

  describe "given a List with 3 items" do
    subject { List.new(1, 2, 3) }

    it "is not empty" do
      subject.wont_be_empty
    end

    it "reads first" do
      subject.first.must_equal 1
    end

    it "reads size" do
      subject.size.must_equal 3
    end

    it "shifts an item" do
      subject.shift(4).must_equal 4
      subject.size.must_equal 4
    end

    it "unshifts all items" do
      subject.unshift.must_equal 1
      subject.unshift.must_equal 2
      subject.unshift.must_equal 3
      subject.unshift.must_be_nil
    end

    it "converts to a String" do
      subject.to_s.must_equal "(1 (2 (3)))"
    end

    it "converts to an enumerator" do
      enumerator = subject.each
      enumerator.next.must_equal 1
      enumerator.next.must_equal 2
      enumerator.next.must_equal 3
      proc { enumerator.next }.must_raise(StopIteration)
    end

    it "maps each node" do
      subject.map { |node| node }.must_equal [1, 2, 3]
    end

    it "gets index 0" do
      subject[0].must_equal 1
    end

    it "gets index 1" do
      subject[1].must_equal 2
    end

    it "gets index 2" do
      subject[2].must_equal 3
    end

    it "reads last" do
      subject.last.must_equal 3
    end

    it "pushes an item" do
      subject.push(42).must_equal 4
      subject.size.must_equal 4
      subject.last.must_equal 42
    end
  end
end
