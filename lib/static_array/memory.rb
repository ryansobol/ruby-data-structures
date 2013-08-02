class StaticArray
  class Memory < Array
    class AddressError < StandardError; end

    # O(1) ;)
    def initialize(size)
      # Ask the operating system for a contiguous chunk of memory ;)
      super

      # Simulate a base-10 word size and starting memory address
      @word = rand(1..8) * 8
      @head = rand(0..5000) * @word
    end

    # O(1)
    attr_reader :word, :head

    # O(1)
    def set(address, value)
      index = address_to_index(address)

      raise AddressError, "illegal address #{address}" if index < 0 || index >= size

      self[index] = value
    end

    # O(1)
    def get(address)
      index = address_to_index(address)

      raise AddressError, "illegal address #{address}" if index < 0 || index >= size

      self[index]
    end

    private

    def address_to_index(address)
      (address - head) / word
    end
  end
end