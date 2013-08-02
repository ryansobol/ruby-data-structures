require_relative "../test_helper"
require "static_array"

describe StaticArray do
  describe "given size of 0" do
    subject { StaticArray.new(0) }

    it "has the correct size" do
      subject.size.must_equal 0
    end

    it "gets the value at index 0" do
      exception = proc { subject[0] }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for StaticArray of size 0"
    end

    it "sets the value at index 0" do
      exception = proc { subject[0] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 0 out of bounds for StaticArray of size 0"
    end
  end

  #################################################################################################

  describe "given size of 1" do
    subject { StaticArray.new(1) }

    it "has the correct size" do
      subject.size.must_equal 1
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for StaticArray of size 1"
    end

    it "gets the value at index 0" do
      subject[0].must_be_nil
    end

    it "gets the value at index 1" do
      exception = proc { subject[1] }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for StaticArray of size 1"
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for StaticArray of size 1"
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
    end

    it "sets the value at index 1" do
      exception = proc { subject[1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 1 out of bounds for StaticArray of size 1"
    end
  end

  #################################################################################################

  describe "given size of 2" do
    subject { StaticArray.new(2) }

    it "has the correct size" do
      subject.size.must_equal 2
    end

    it "gets the value at index -1" do
      exception = proc { subject[-1] }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for StaticArray of size 2"
    end

    it "gets the value at index 0" do
      subject[0].must_be_nil
    end

    it "gets the value at index 1" do
      subject[1].must_be_nil
    end

    it "gets the value at index 2" do
      exception = proc { subject[2] }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for StaticArray of size 2"
    end

    it "sets the value at index -1" do
      exception = proc { subject[-1] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index -1 out of bounds for StaticArray of size 2"
    end

    it "sets the value at index 0" do
      subject[0] = 42
      subject[0].must_equal 42
      subject[1].must_be_nil
    end

    it "sets the value at index 1" do
      subject[1] = 42
      subject[1].must_equal 42
      subject[0].must_be_nil
    end

    it "sets the value at index 2" do
      exception = proc { subject[2] = 42 }.must_raise(IndexError)
      exception.message.must_equal "index 2 out of bounds for StaticArray of size 2"
    end
  end
end
