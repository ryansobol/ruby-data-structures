require_relative "../../test_helper"
require "static_array/memory"

describe StaticArray::Memory do
  describe "given a block of memory" do
    subject { StaticArray::Memory.new(1) }

    it "has the correct word" do
      [8, 16, 24, 32, 40, 48, 56, 64].must_include subject.word
    end

    it "has the correct head" do
      subject.head.must_be :>=, 0
      subject.head.must_be :<=, 320_000

      (subject.head % subject.word).must_equal 0
    end

    it "gets a value from a legal address" do
      address = subject.head
      subject.get(address).must_be_nil
    end

    it "gets a value from an illegal address" do
      address   = subject.head - subject.word
      exception = proc { subject.get(address) }.must_raise(StaticArray::Memory::AddressError)
      exception.message.must_equal "illegal address #{address}"
    end

    it "sets a value into a legal address" do
      address = subject.head
      subject.set(address, 42).must_equal 42
      subject.get(address).must_equal 42
    end

    it "sets a value into an illegal address" do
      address   = subject.head - subject.word
      exception = proc { subject.set(address, 42) }.must_raise(StaticArray::Memory::AddressError)
      exception.message.must_equal "illegal address #{address}"
    end
  end
end
