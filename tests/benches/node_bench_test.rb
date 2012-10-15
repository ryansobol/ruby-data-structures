require "../../lib/node"
require "../test_helper"

class NodeBenchTest < MiniTest::Unit::TestCase
  TRIALS = 300_000
  THRESHOLD = 0.99

  def self.bench_range
    bench_linear(1, 5, 1)
  end

  # O(1) ######################################################################

  def bench_new
    assert_performance_constant(THRESHOLD) do
      TRIALS.times { Node.new(1) }
    end
  end

  def bench_read_value
    assert_performance_constant(THRESHOLD) do
      subject = Node.new(1)
      TRIALS.times { subject.value }
    end
  end

  def bench_read_next
    assert_performance_constant(THRESHOLD) do
      subject = Node.new(1, Node.new(5))
      TRIALS.times { subject.next }
    end
  end

  def bench_set_value
    assert_performance_constant(THRESHOLD) do
      subject = Node.new(1)
      TRIALS.times { |trial| subject.value = trial }
    end
  end

  def bench_set_next
    assert_performance_constant(THRESHOLD) do
      subject = Node.new(1)
      nexts = [Node.new(1), Node.new(1)]
      TRIALS.times { |trial| subject.next = nexts[trial % 2] }
    end
  end
end
