require_relative "../test_helper"
require "dynamic_array"

describe DynamicArray do
  describe "given no size" do
    subject { DynamicArray.new }

    it "has the correct size" do
      subject.size.must_equal 0
    end

    it "has the correct capacity" do
      subject.capacity.must_equal 4
    end
  end

  #################################################################################################

  describe "given a size of 1" do
    subject { DynamicArray.new(1) }

    it "has the correct size" do
      subject.size.must_equal 1
    end

    it "has the correct capacity" do
      subject.capacity.must_equal 4
    end
  end

  #################################################################################################

  describe "given a size of 2" do
    subject { DynamicArray.new(2) }

    it "has the correct size" do
      subject.size.must_equal 2
    end

    it "has the correct capacity" do
      subject.capacity.must_equal 4
    end
  end

  #################################################################################################

  describe "given a size of 3" do
    subject { DynamicArray.new(3) }

    it "has the correct size" do
      subject.size.must_equal 3
    end

    it "has the correct capacity" do
      subject.capacity.must_equal 6
    end
  end

  #################################################################################################

  describe "#[]=" do
    subject { DynamicArray.new }

    it "sets the value for index 0" do
      (subject[0] = "J").must_equal "J"

      subject.size.must_equal 1
      subject.capacity.must_equal 4
    end

    it "sets the value for index 1" do
      (subject[1] = "A").must_equal "A"

      subject.size.must_equal 2
      subject.capacity.must_equal 4
    end

    it "sets the value for index 2" do
      (subject[2] = "N").must_equal "N"

      subject.size.must_equal 3
      subject.capacity.must_equal 4
    end

    it "sets the value for index 3" do
      (subject[3] = "E").must_equal "E"

      subject.size.must_equal 4
      subject.capacity.must_equal 4
    end

    it "sets the value for index 4" do
      (subject[4] = "Y").must_equal "Y"

      subject.size.must_equal 5
      subject.capacity.must_equal 10
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 too small for DynamicArray of size 0"
    end

    describe "given values for index 0 and 1" do
      before do
        subject[0] = "J"
        subject[1] = "A"
      end

      it "sets the value at index -1" do
        (subject[-1] = 42).must_equal 42

        subject.size.must_equal 2
        subject.capacity.must_equal 4
      end

      it "sets the value at index -2" do
        (subject[-2] = 42).must_equal 42

        subject.size.must_equal 2
        subject.capacity.must_equal 4
      end

      it "sets the value at index -3" do
        exception = proc { subject[-3] = 42 }.must_raise(IndexError)
        exception.message.must_equal "index -3 too small for DynamicArray of size 2"
      end
    end
  end

  #################################################################################################

  describe "#[]" do
    subject { DynamicArray.new }

    before do
      subject[0] = "D"
      subject[1] = "A"
    end

    it "gets the value for index 0" do
      subject[0].must_equal "D"
    end

    it "gets the value for index 1" do
      subject[1].must_equal "A"
    end

    it "gets the value for index 2" do
      subject[2].must_be_nil
    end

    it "gets the value for index -1" do
      subject[-1].must_equal "A"
    end

    it "gets the value for index -2" do
      subject[-2].must_equal "D"
    end

    it "gets the value for index -3" do
      subject[-3].must_be_nil
    end
  end

  #################################################################################################

  describe "#push" do
    subject { DynamicArray.new }

    it "pushes another value" do
      subject.push("J").must_equal "J"

      subject.size.must_equal 1
      subject.capacity.must_equal 4
    end

    it "pushes another value" do
      subject.push("J")
      subject.push("A").must_equal "A"

      subject.size.must_equal 2
      subject.capacity.must_equal 4
    end

    it "pushes another value" do
      subject.push("J")
      subject.push("A")
      subject.push("N").must_equal "N"

      subject.size.must_equal 3
      subject.capacity.must_equal 4
    end

    it "pushes another value" do
      subject.push("J")
      subject.push("A")
      subject.push("N")
      subject.push("E").must_equal "E"

      subject.size.must_equal 4
      subject.capacity.must_equal 4
    end

    it "pushes another value" do
      subject.push("J")
      subject.push("A")
      subject.push("N")
      subject.push("E")
      subject.push("Y").must_equal "Y"

      subject.size.must_equal 5
      subject.capacity.must_equal 10
    end
  end

  #################################################################################################

  describe "#pop" do
    subject { DynamicArray.new }

    before do
      subject.push("J")
      subject.push("A")
      subject.push("N")
      subject.push("E")
      subject.push("Y")
    end

    it "pops another value" do
      subject.pop.must_equal "Y"

      subject.size.must_equal 4
      subject.capacity.must_equal 10
    end

    it "pops another value" do
      subject.pop
      subject.pop.must_equal "E"

      subject.size.must_equal 3
      subject.capacity.must_equal 10
    end

    it "pops another value" do
      subject.pop
      subject.pop
      subject.pop.must_equal "N"

      subject.size.must_equal 2
      subject.capacity.must_equal 4
    end

    it "pops another value" do
      subject.pop
      subject.pop
      subject.pop
      subject.pop.must_equal "A"

      subject.size.must_equal 1
      subject.capacity.must_equal 4
    end

    it "pops another value" do
      subject.pop
      subject.pop
      subject.pop
      subject.pop
      subject.pop.must_equal "J"

      subject.size.must_equal 0
      subject.capacity.must_equal 4
    end
  end
end
